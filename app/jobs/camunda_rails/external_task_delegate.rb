module CamundaRails
  class ExternalTaskDelegate < ApplicationJob
    queue_as :external_task_delegates

    class << self
      attr_accessor :execute_block
      def execute(&block)
        self.execute_block = block
      end
    end

    def perform(*args)
      external_task = ExternalTask.find(args.first)
      params = {} # TODO: add params
      self.class.execute_block.call(external_task, params)
      # Do something later
    end
  end
end
