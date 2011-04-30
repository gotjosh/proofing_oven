Fabricator(:user) do
  email { Fabricate.sequence(:email) { |i| "user#{i}@example.com" } }
  password "password"
end

Fabricator(:confirmed_user, from: :user) do
  password "password"
  password_confirmation "password"
  confirmation_token nil
  confirmed_at { Time.now }
end
