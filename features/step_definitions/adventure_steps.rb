Given /^I have started a new adventure$/ do
  visit new_adventure_path
end

Then /^I should start a new adventure$/ do
  page.should have_css('.description', text: 'You wake up on a grassy bank')
end

When /^I move (North|South|East|West)$/ do |direction|
  click_link 'Go ' + direction
end

Then /^the adventure should take me to the trees$/ do
  page.should have_css('.description', text: 'Thick trees are at the foot of a mountain')
end

Then /^the adventure should take me to the evergreen glade$/ do
  page.should have_css('.description', text: 'You are in an evergreen glade')
end

Then /^the adventure should take me to the deep river$/ do
  page.should have_css('.description', text: 'To the South a deep river is running swiftly')
end

Then /^the adventure should take me to the old stone wall$/ do
  page.should have_css('.description', text: 'To the West is an old stone wall')
end

When /^I try to move (North|South|East|West)/ do |direction|
  visit move_path(direction.downcase)
end

Then /^the adventure should take me back to the grassy bank$/ do
  page.should have_css('.description', text: 'On a grassy bank a figure lies sleeping')
end

Then /^I should not be able to go that way$/ do
  page.should have_css('.error', text: "You can't go that way")
end

Then /^the adventure should be over$/ do
  page.should have_css('h1', text: 'Adventure over')
end

Then /^I should be lost$/ do
  page.should have_content('You are lost, but you find a clue:')
  page.should_not have_css("a[href^='/go/']")
end

When /^I quit the adventure$/ do
  within(:css, '#controls') { click_link('Quit') }
end

Then /^I should see the quit adventure confirmation page$/ do
  page.should have_content('Are you sure you want to quit?')
end

When /^I confirm that I am sure about quitting the adventure$/ do
  click_button('Yes')
end

When /^I change my mind about quitting$/ do
  click_link('No')
end

Then /^I should see the completed adventure success message$/ do
  page.should have_css('.success', text: 'You have solved the mystery of Merlin!')
end
