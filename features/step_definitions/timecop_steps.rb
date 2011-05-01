Given /^today is "([^"]*)"$/ do |date|
  Timecop.travel(date.to_date)
end
