Given(/^there are other users who have favorites$/) do
  FactoryGirl.create(:favorite, menu_item_id: 1, user_id: @users[:public][0])
  FactoryGirl.create(:favorite, menu_item_id: 2, user_id: @users[:public][1])
  FactoryGirl.create(:favorite, menu_item_id: 2, user_id: @users[:public][0])
  FactoryGirl.create(:favorite, menu_item_id: 1, user_id: @users[:public][1])
end

Given(/^there are no other users who have favorites$/) do
  @users[:public].each do |user|
    user.favorites = []
  end
end

Given(/^there are no other users$/) do
  @users = []
end

Given(/^I am looking at a merchant with a menu$/) do
  @merchant = Merchant.find(1)
  visit "/merchants/1"
end

Given(/^I am on the favorites page$/) do
  visit "/favorites"
end

Given(/^I have favorites$/) do
  @favorites = FactoryGirl.create_list(:favorite, 5)
  @user.favorites = @favorites
end

Given(/^I have specific favorites$/) do
  @favorites = FactoryGirl.create(:favorite, menu_item_id: 1, user_id: @user.id)
  @favorites = FactoryGirl.create(:favorite, menu_item_id: 2, user_id: @user.id)
end

Given(/^I have no favorites$/) do
  @favorites = []
end

Given(/^that menu item is already a favorite$/) do
  @favorite = FactoryGirl.create(:favorite, menu_item_id: 1, user_id: @user.id)
end

When(/^I go to that merchant page$/) do
  visit "/merchants/1"
end

When(/^I click the friends favorites button$/) do
  click_link "Friends Favorites"
end

When(/^I click the my favorites link$/) do
  click_link "My Favorites"
end

When(/^I click favorites$/) do
  first(".add-favorite").click
end

When(/^I click to remove a favorite$/) do
  first(".remove-favorite").click
end

When(/^I click to remove another favorite$/) do
  first(".remove-favorite").click
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

Then(/^the meal is visible in my account as a favorite$/) do
  expect(page).to have_content("You have 1 Favorite")
  expect(page).to have_content(@merchant.name)
end

Then(/^there is a remove button$/) do
  expect(page).to have_content("Remove from Favorites")
end

Then(/^that favorite is removed$/) do
  expect(page).to have_content ("You have 1 Favorite")
end

Then(/^another favorite is removed$/) do
  expect(page).to have_content("You have 0 Favorites")
end

Then(/^I should not be able to click a remove button$/) do
  expect(page).not_to have_content("Remove from Favorites")
end

Then(/^I can see all my favorites$/) do
  expect(page).to have_content("You have 5 Favorites")
end

Then(/^I am informed that I have no favorites$/) do
  expect(page).to have_content("You have 0 Favorites")
end