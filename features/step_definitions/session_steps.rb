Given 'I am signed in' do
  @user = User.last || Fabricate(:user)
  Given %(I am on the new user session page)
  When  %(I fill in "Email" with "#{@user.email}")
  And   %(I fill in "Password" with "password")
  And   %(I press "Sign In")
end
