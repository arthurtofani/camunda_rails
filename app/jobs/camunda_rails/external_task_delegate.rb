module CamundaRails
  class ExternalTaskDelegate < ApplicationJob
    queue_as :external_task_delegates
    @sleep_thread = nil

    class << self
      attr_accessor :execute_block
      def execute(&block)
        self.execute_block = block
      end
    end

    def perform(*args)
      external_task = ExternalTask.find(args.first)
      dt = time_diff(Time.now.utc, external_task.lock_expiration_time.to_datetime.utc)
      timed_out = (dt < 0)
      execute_task(external_task, dt) unless timed_out
      external_task.update(state: 'timeout') if timed_out
    end

    def time_diff(start, finish)
      (finish - start)
    end

    def execute_task(external_task, dt)
      ActiveRecord::Base.transaction do
        @sleep_thread = Thread.new{ sleep(dt); raise ActiveRecord::Rollback }
        result = self.class.execute_block.call(external_task, vars(external_task))
        external_task.update(result_variables: result)
        @sleep_thread.kill
      end
      external_task.complete!
    end

    def vars(external_task)
      external_task.variables
                   .to_a
                   .map{|s| [s[0], s[1]["value"]] }
                   .to_h
    end



  end
end
