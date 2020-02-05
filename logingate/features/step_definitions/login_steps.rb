
Given(/^a user is on the login page$/) do
  logingate.login.assert_username_field_displayed
end

And(/^a user has entered valid credentials$/) do
  logingate.login.enter_credentials
end

When(/^the user attempts to sign in$/) do
  logingate.login.tap_enabled_login_button
end

And(/^the user should be successfully signed in toast message$/) do
  logingate.login.assert_message_displayed?
end