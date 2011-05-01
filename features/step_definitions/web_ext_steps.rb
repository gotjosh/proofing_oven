Then /^(?:|I )should see an image named "([^"]*)"$/ do |image_name|
  page.should have_xpath('//img', :src => image_name)
end