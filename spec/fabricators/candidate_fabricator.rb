Fabricator(:candidate) do
  first_name "John"
  last_name "Doe"
  email { Fabricate.sequence(:email) {|i| "user#{i}-#{Time.now.to_i}@example.com" } }
  phone "(904) 555-1212"
  github "john"
  twitter "john"
  local false
  willing_to_relocate true
end
