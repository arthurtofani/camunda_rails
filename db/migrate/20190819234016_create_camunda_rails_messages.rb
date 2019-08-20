class CreateCamundaRailsMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :camunda_rails_messages do |t|
      t.string :message_name
      t.string :business_key
      t.string :tenant_id
      t.boolean :without_tenant_id
      t.string :process_instance_id
      t.json :correlation_keys
      t.json :process_variables
      t.boolean :all
      t.boolean :result_enabled
      t.string :state

      t.timestamps
    end
  end
end
