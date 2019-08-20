module CamundaRails
  class ExternalTask < ApplicationRecord
    def self.fetch
      tasks = Camunda::ExternalTask.all
      tasks.each do |task|
        camunda_id = task.attributes[:id]
        attrs = task.attributes
                    .to_a
                    .map{|s| s[0] = s[0].underscore.to_sym; s}
                    .to_h
                    .except(:id)
        attrs[:camunda_id] = camunda_id
        CamundaRails::ExternalTask.create(attrs)
      end
    end
  end
end
