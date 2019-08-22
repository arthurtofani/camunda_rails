class ExternalTaskTwo < CamundaRails::ExternalTaskDelegate
  execute do |task|
    puts "daee"
  end
end