require 'rails_helper'

module CamundaRails
  RSpec.describe ExternalTask, type: :model do
    describe "self.fetch_and_lock" do
      it "runs" do
        #binding.pry
        #Message.throw_message("startExternalTaskProcess")
        #puts "go"
        #binding.pry
        ExternalTask.fetch_and_lock
        sleep(3)

        Message.throw_message("goSecond")
        sleep(3)
        ExternalTask.fetch_and_lock
      end
    end
  end
end
