module CamundaRails
  class Engine < ::Rails::Engine
    isolate_namespace CamundaRails

    config.generators do |g|
      g.test_framework :rspec
    end
  end
end
