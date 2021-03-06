require 'log'
require 'user'

Given /^I am a Timesheet user$/ do 
  @user = User.new
  @username = @user.name
end

Given /^I am currently (in|out)$/ do |status|
  @user.status == status
end

When /^I clock (in|out)$/ do |action|
  `bundle exec bin/timesheet -u "#{@username} #{action}"`
end

Then /^my username and time (in|out) should be posted on my timesheet$/ do |status|
  @user.mklog(@username)
end

Then /^I should see a message that I am already clocked (in|out)$/ do |status|
  STDOUT.puts "Looks like you are already #{status}!"
end

And /^I should be asked what I want to do next$/ do
  pending("Not sure how to handle options on this one")
end