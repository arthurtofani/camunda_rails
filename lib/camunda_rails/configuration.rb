module CamundaRails
  class ExternalTaskConfig
    attr_accessor :topic_name, :use_class, :lock_duration, :max_tasks, :priority

    def initialize(topic_name, params)
      self.topic_name = topic_name
      params.each {|k,v| public_send("#{k}=",v)}
      self.use_class = self.use_class || get_class(self.topic_name)
    end

    private

    def get_class(topic_name)
      "#{topic_name.camelize}".constantize
    end
  end

  class Configuration
    class << self
      attr_accessor :external_tasks, :worker_id
    end
    attr_accessor :engine_rest_url

    def worker_id=(value)
      self.class.worker_id = value
    end

    def subscribe_to(topic_name, params = {})
      task_config = ExternalTaskConfig.new(topic_name, params)
      self.class.external_tasks ||= []
      self.class.external_tasks << task_config
    end

  end
end
