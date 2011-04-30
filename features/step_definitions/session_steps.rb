Given 'I am signed in' do
  @me = User.last || Fabricate(:user)
  Given %(I am on the new user session page)
  When  %(I fill in "Email" with "#{@me.email}")
  And   %(I fill in "Password" with "password")
  And   %(I press "Sign In")
end
