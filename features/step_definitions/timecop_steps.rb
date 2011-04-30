Given /it is currently "([^"]*)"/ do |time|
  Timecop.travel Time.parse(time)
end
