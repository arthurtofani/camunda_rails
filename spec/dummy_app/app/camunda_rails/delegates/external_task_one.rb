class ExternalTaskOne < CamundaRails::ExternalTaskDelegate
  execute do |task, params|
    binding.pry
  end
end