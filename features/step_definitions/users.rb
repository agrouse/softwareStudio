Given /^a user with username "([^\"]*)" and password "([^\"]*)"$/ do |username, password|
  Person.create(:username => username, :password => password, :password_confirmation => password)
end
Given /^I am signed in with username "([^\"]*)" and password "([^\"]*)"$/ do |username, password|
  visit 'access/login'
  fill_in("username", :with => username)
  fill_in("password", :with => password)
  click_button("submit")
end
When /^I sign in as "([^\"]*)" with password "([^\"]*)"$/ do |username, password|
  fill_in("username", :with => username)
  fill_in("password", :with => password)
  click_button("submit")
end