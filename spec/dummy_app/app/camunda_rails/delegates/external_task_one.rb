class ExternalTaskOne < CamundaRails::ExternalTaskDelegate
  execute do |task|
    puts "okok"
  end
end