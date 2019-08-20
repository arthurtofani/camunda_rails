class CreateCamundaRailsMessageResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :camunda_rails_message_responses do |t|
      t.integer :code
      t.string :result_type
      t.json :execution
      t.json :process_instance
      t.references :message, index: {name: :message_id_idx}

      t.timestamps
    end
  end
end
