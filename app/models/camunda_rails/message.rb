module CamundaRails
  class Message < ApplicationRecord
    has_many :message_responses
    def self.throw_message(message_name, params={})
      message = Message.new(params)
      message.state = "new"
      message.message_name = message_name
      if message.save
        message.throw_me
      else
        puts "err"
      end
    end

    def throw_me
      update(state: "sending")
      params = self.as_json
                   .except("id","state", "created_at", "updated_at")
                   .to_a
                   .map{|a| a[0]=a[0].camelize(:lower);a}
                   .select{|a| a[1]}
                   .to_h
      sent_message = Camunda::Message.create(params)
      self.message_responses.create(code: 204) # TODO: other msgs
      update(state: "sent")
    end

  end
end
