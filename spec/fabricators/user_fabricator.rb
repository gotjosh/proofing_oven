Fabricator(:user) do
  password 'password'
  password_confirmation(&:password)
end
