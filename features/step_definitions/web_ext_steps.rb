Then /^(?:|I )should see "([^"]*)" (\d+) times?$/ do |text, count|
  page.should have_xpath("./descendant-or-self::*[contains(normalize-space(text()), 'John is a nice guy!')]", count: count.to_i)
end
