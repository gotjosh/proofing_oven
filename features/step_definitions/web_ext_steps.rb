Then /^the "([^"]*)" select(?: within "([^"]*)")? should contain "([^"]*)"$/ do |field, selector, value|
  with_scope(selector) do
    field = find_field(field)
    field_value = field.find("option[selected]").text
    field_value.should =~ /#{value}/
  end
end

Then /^the "([^"]*)" field should be empty$/ do |field|
  find_field(field).value.should be_blank
end
