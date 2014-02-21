When(/^I go to the homepage$/) do
  visit root_path
end

Then(/^I should see "(.*?)"$/) do |text|
  page.should have_content(text)
end

When(/^I press "(.*?)"$/) do |text|
  click_button(text)
end

When(/^I fill in "(.*?)" with "(.*?)"$/) do |field, content|
  fill_in(field, with: content)
end

When(/^I follow "(.*?)"$/) do |text|
  click_link(text)
end

Then(/^show me the page$/) do
  save_and_open_page
end