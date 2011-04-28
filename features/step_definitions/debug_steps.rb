Then 'I debug' do
  require 'ruby-debug'; Debugger.start; Debugger.settings[:autoeval] = 1; Debugger.settings[:autolist] = 1; debugger
  $cucumber_debugged = true
end

When /^I wait (\d+) seconds?$/ do |seconds|
  sleep seconds.to_i
end

at_exit do
  if $cucumber_debugged
    $stderr.puts "*" * 79
    $stderr.puts "Warning: debugging step was used!"
    $stderr.puts "*" * 79
  end
end
