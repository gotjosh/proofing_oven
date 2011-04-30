Then /^the "([^"]*)" tab should be highlighted$/ do |tab_name|
  page.should have_xpath("//nav//li[contains(@class, 'active')]//a", text: tab_name)
end
