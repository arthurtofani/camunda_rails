require 'rails_helper'

module CamundaRails
  RSpec.describe ExternalTask, type: :model do
    it "self.fetch" do
      ExternalTask.fetch
    end
  end
end
