Given /^a user with username "([^\"]*)" and password "([^\"]*)"$/ do |username, password|
  Person.create(:username => username, :password => password, :password_confirmation => password)
end
Given /^I am signed in with username "([^\"]*)" and password "([^\"]*)"$/ do |username, password|
  self.use_transactional_fixtures = false
  visit 'access/login'
  fill_in("Username", :with => username)
  fill_in("Password", :with => password)
  click_button("submit")
end
When /^I sign in as "([^\"]*)" with password "([^\"]*)"$/ do |username, password|
  self.use_transactional_fixtures = false
  fill_in("Username", :with => username)
  fill_in("Password", :with => password)
  click_button("submit")
end
Then /^user "([^\"]*)" should exist$/ do |username|
  @search=Person.find_by_username(username)
  assert @search != nil
end
Then /^user "([^\"]*)" should not exist$/ do |username|
  @search=Person.find_by_username(username)
  assert @search == nil
end