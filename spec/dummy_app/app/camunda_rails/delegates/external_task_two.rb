class ExternalTaskTwo < CamundaRails::ExternalTaskDelegate
  execute do |task, vars|
    vars
  end
end