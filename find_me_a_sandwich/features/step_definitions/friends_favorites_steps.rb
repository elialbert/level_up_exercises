Given(/^there are no other users who have favorites$/) do
  @users[:public].each do |user|
    user.favorites = []
  end
end

Given(/^there are no other users$/) do
  @users = []
end

When(/^I click the friends favorites button$/) do
  click_link "Friends Favorites"
end

Then(/^I see my friends favorites$/) do
  expect(page).to have_content("You have 10 Friends")
end

Then(/^I am informed that my friends have no favorites$/) do
  expect(page).to have_content("They have 0 Favorites")
end

Then(/^I am informed that I have no friends$/) do
  expect(page).to have_content("You have 0 Friends")
end
