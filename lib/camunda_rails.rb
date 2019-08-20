require "camunda_rails/engine"
require "camunda_rails/delegates"
require "camunda_rails/configuration"

module CamundaRails
  class << self
    attr_reader :config

    def configure
      @config = Configuration.new
      yield config
    end
  end
end
