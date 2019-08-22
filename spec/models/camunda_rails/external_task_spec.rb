require 'rails_helper'

module CamundaRails
  RSpec.describe ExternalTask, type: :model do
    describe "self.fetch_and_lock" do
      it "runs" do
        Message.throw_message("startExternalTaskProcess")
        ExternalTask.fetch_and_lock
        sleep(1)
        ExternalTask.fetch_and_lock
      end
    end
  end
end
