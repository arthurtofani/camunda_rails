class CreateCamundaRailsExternalTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :camunda_rails_external_tasks do |t|
      t.string :camunda_id
      t.string :state, default: 'new'
      t.string :activity_id
      t.string :activity_instance_id
      t.string :error_message
      t.string :business_key
      t.string :error_details
      t.string :execution_id
      t.string :lock_expiration_time
      t.string :process_definition_id
      t.string :process_definition_key
      t.string :process_instance_id
      t.string :tenant_id
      t.string :retries
      t.string :suspended
      t.string :worker_id
      t.string :priority
      t.string :topic_name
      t.json :variables
      t.json :result_variables

      t.timestamps
    end
  end
end
