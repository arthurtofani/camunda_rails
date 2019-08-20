CamundaRails.configure do |cfg|
  cfg.subscribe_to "ExternalTaskOne"
  cfg.subscribe_to "ExternalTaskTwo"
end
