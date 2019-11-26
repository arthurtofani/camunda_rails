module CamundaRails
  class ExternalTask < ApplicationRecord

    after_create  :enqueue_task

    def self.fetch_and_lock
      CamundaRails::Configuration.external_tasks.each do |external_task|
        topic_vars = {
          "topicName" => external_task.topic_name,
          "lockDuration" => external_task.lock_duration,
          "deserializeValues" => true,
        }
        lock_vars = {
          "workerId" => Configuration.worker_id,
          "maxTasks" => external_task.max_tasks,
          "usePriority" => external_task.priority,
          "topics" => [topic_vars]
        }

        response = Camunda::ExternalTask.post("fetchAndLock", nil, lock_vars.to_json)
        tasks = JSON.parse(response.body)
        tasks.each do |task|
          camunda_id = task['id']
          attrs = task.to_a
                      .map{|s| s[0] = s[0].underscore.to_sym; s}
                      .to_h
                      .except(:id)
          attrs[:camunda_id] = camunda_id
          CamundaRails::ExternalTask.create(attrs)
        end
      end
    end

    def expired?
      lock_expiration_time.to_date < DateTime.now
    end

    def complete!
      update(state: 'completed')
      vars = variables.map{|s| change_var(s[0], s[1])}.to_h
      obj = {"workerId" => worker_id, "variables" => vars}
      response = Camunda::ExternalTask.post("#{camunda_id}/complete", nil, obj.to_json)
    end

    private

    def change_var(key, obj)
      obj["value"] = result_variables[key]
      [key, obj]
    end

    def enqueue_task
      update(state: 'enqueued')
      job_class = config.use_class
      job_class.perform_now(id)
    end

    def config
      CamundaRails::Configuration.external_tasks
        .select{|s| s.topic_name==topic_name}
        .first
    end
  end
end
