Fabricator(:user) do
  email { Fabricate.sequence(:email) {|i| "user#{i}-#{Time.now.to_i}@example.com" } }
  password 'password'
end
