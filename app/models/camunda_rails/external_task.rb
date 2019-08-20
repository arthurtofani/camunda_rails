module CamundaRails
  class ExternalTask < ApplicationRecord
    def self.fetch
      # não é assim q faz
      # usar o fetchAndLock direto
      CamundaRails::Configuration.external_tasks.keys.each do |key|
        tasks = Camunda::ExternalTask.get("?topicName=#{key}")
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

    before_create :lock_task
    after_create :enqueue_task

    private

    def lock_task
      # TODO: https://docs.camunda.org/manual/7.6/reference/rest/external-task/fetch/
    end

    def complete
      #TODO: https://docs.camunda.org/manual/7.6/reference/rest/external-task/post-complete/
    end

    def enqueue_task
      update(state: 'enqueued')
      CamundaRails::Configuration.external_tasks[topic_name].perform_now(self.id)
    end
  end
end
