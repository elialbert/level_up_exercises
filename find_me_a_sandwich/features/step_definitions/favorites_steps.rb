Given(/^there are other users who have favorites$/) do
  @users[0].favorites = FactoryGirl.create_list(:favorite, 1)
  @users[1].favorites = FactoryGirl.create_list(:favorite, 1)
end

Given(/^there are no other users who have favorites$/) do
  @users.each do |user|
    user.favorites = []
  end
end

Given(/^there are no other users$/) do
  @users = []
end

Given(/^I am on a meal page$/) do
  visit "/meals/1"  
end

Given(/^I am on the favorites page$/) do
  visit "/favorites"
end

Given(/^I have favorites$/) do
  @favorites = FactoryGirl.create_list(:favorite, 5)
  @user.favorites = @favorites
end

Given(/^I have no favorites$/) do
  @favorites = []
end

When(/^I click the friends favorites button$/) do
  click_button "Friends Favorites"
end

When(/^I click favorite$/) do
  click_button "My Favorites"
end

When(/^I click to remove a favorite$/) do
  click_button "Remove from favorites"
end

When(/^that meal is already a favorite$/) do
  @favorite = FactoryGirl.create(:favorite, id: 1)
  @user.favorites << @favorite
end

When(/^I click to remove another favorite$/) do
  click_button "Remove from favorites"
end

When(/^I click the favorites page link$/) do
  click_button "Favorites"
end

Then(/^I see my friends favorites$/) do
  expect(page).to have_content("Your friends have 10 favorites")
end

Then(/^I am informed that my friends have no favorites$/) do
  expect(page).to have_content("Your friends have no favorites")
end

Then(/^I am informed that I have no friends$/) do
  expect(page).to have_content("Sorry, you have no friends!")
end

Then(/^the meal is visible in my account as a favorite$/) do
  expect(page).to have_content("You have 1 Favorite")
end

Then(/^there is no favorite button$/) do
  expect(page).not_to have_content("Add to favorites")
end

Then(/^that favorite is removed$/) do
  expect(page).to have_content ("You have 1 favorite")
end

Then(/^another favorite is removed$/) do
  expect(page).to have_content("You have 0 Favorites")
end

Then(/^I should not be able to click a remove button$/) do
  expect(page).not_to have_content("Remove favorite")
end

Then(/^I can see all my favorites$/) do
  expect(page).to have_content("You have 5 Favorites")
end

Then(/^I am informed that I have no favorites$/) do
  expect(page).to have_content("You have 0 Favorites")
end