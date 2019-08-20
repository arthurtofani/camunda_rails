module CamundaRails
  class Configuration
    class << self
      attr_accessor :external_tasks
    end
    attr_accessor :engine_rest_url

    def subscribe_to(topic_name, klass=nil)
      self.class.external_tasks ||= {}
      self.class.external_tasks[topic_name.to_s] = (klass || get_class(topic_name))
    end

    private

    def get_class(topic_name)
      "#{topic_name.camelize}".constantize
    end
  end
end
