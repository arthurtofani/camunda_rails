class ExternalTaskOne < CamundaRails::ExternalTaskDelegate
  execute do |task, vars|
    binding.pry
    vars["message"] = vars["message"].reverse
    vars
  end
end