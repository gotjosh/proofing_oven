When /^I (accept|dismiss) the "([^"]*)" alert$/ do |action, text|
  alert = page.driver.browser.switch_to.alert
  alert.text.should eq(text)
  alert.send(action)
end

Then /^I should see checkboxes for the following skills:$/ do |table|
  table.raw.each do |row|
    field_labeled(row.first)['type'].should == 'checkbox'
  end
end

Then /^I should see a link to "([^"]*)"$/ do |filename|
  page.should have_css("a[href*='#{filename}']", text: filename)
end
