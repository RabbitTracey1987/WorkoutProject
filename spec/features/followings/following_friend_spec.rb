require "rails_helper"
RSpec.feature "Folloing Friends" do 
	before do
		@john = User.create!(first_name:"John",last_name:"Smith",email: "john@example.com", password: "password")
    @peter = User.create!(first_name:"Peter",last_name:"Smith",email: "peter@example.com", password: "password")

		login_as(@john)
	end
	scenario "if signed in " do 
    visit "/"
    
    expect(page).to have_content(@john.full_name)
    expect(page).to have_content(@peter.full_name)
    href = "/friendships?friend_id=#{@john.id}"
    expect(page).not_to have_link("Follow",:href=> href)
    link="a[href='/friendships?friend_id=#{@peter.id}']"
    find(link).click
    href= "/friendships?friend_id=#{@peter.id}"
    expect(page).not_to have_link("Follow",:href=> href)

	end
  # scenario "with invalid inputs" do 
  #   fill_in "Duration", with: ''
  #   fill_in "Workout Details", with: ""
  #   fill_in "Activity date", with: ""
  #   click_button "Create Exercise"
  #   expect(page).to have_content("Exercise has not been created")
  #   expect(page).to have_content("Duration in min is not a number")
  #   expect(page).to have_content("Workout details can't be blank")
  #   expect(page).to have_content("Activity date can't be blank")
  # end
 
end
