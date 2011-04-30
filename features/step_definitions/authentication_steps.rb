Given /^I am signed in$/ do
  @user = Fabricate(:confirmed_user)
  When %(I go to the sign in page)
  And %(I fill in "Email" with "#{@user.email}")
  And %(I fill in "Password" with "#{@user.password}")
  And %(I press "Sign In")
end
