CamundaRails.configure do |cfg|
  cfg.worker_id = "dummy_application1"

  cfg.subscribe_to "ExternalTaskOne", max_tasks: 10, priority: 2, lock_duration: 10000
  cfg.subscribe_to "externalTaskTwo", max_tasks: 10, priority: 2, lock_duration: 10000
end
