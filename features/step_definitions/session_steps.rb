Given /^I am signed in$/ do
  @me = Fabricate(:user)
  When %Q(I am on the home page)
  And %Q(I follow "Sign in")
  And %Q(I fill in "Email" with "#{@me.email}")
  And %Q(I fill in "Password" with "#{@me.password}")
  And %Q(I press "Sign In")
end
