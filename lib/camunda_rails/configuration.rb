module CamundaRails
  class Configuration
    @@external_tasks = {}
    attr_accessor :engine_rest_url

    def subscribe_to(topic_name, klass=nil)
      binding.pry
      @@external_tasks[topic_name.to_s] = (klass_name || get_class(topic_name))
    end

    private

    def get_class(topic_name)
      "CamundaRails::Delegates::#{topic_name.camelize}".constantize
    end
  end
end
