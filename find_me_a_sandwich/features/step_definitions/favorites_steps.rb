Given(/^there are other users who have favorites$/) do
  FactoryGirl.create(:favorite, menu_item_id: 1, user_id: @users[:public][0])
  FactoryGirl.create(:favorite, menu_item_id: 2, user_id: @users[:public][1])
  FactoryGirl.create(:favorite, menu_item_id: 2, user_id: @users[:public][0])
  FactoryGirl.create(:favorite, menu_item_id: 1, user_id: @users[:public][1])
end

Given(/^I am on the favorites page$/) do
  visit "/favorites"
end

Given(/^I have favorites$/) do
  @favorites = FactoryGirl.create_list(:favorite, 5)
  @user.favorites = @favorites
end

Then(/^that favorite is removed$/) do
  expect(page).to have_content ("You have 1 Favorite")
end
