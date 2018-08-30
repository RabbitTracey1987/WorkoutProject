require "rails_helper"
RSpec.feature "Editing Exercise" do 
	before do
		@john = User.create!(first_name:"John",last_name:"Smith",email: "john@example.com", password: "password")
    @john_exercise = @john.exercises.create!(duration_in_min:35,
                                              workout:"first activity",
                                              workout_date: Date.today)
		login_as(@john)
	end
	scenario "with valid data succeed" do 
    visit "/"
    click_link "My Lounge"
    path= "/users/#{@john.id}/exercises/#{@john_exercise.id}/edit"
    link= "a[href=\'#{path}\']"
    find(link).click
    fill_in "Duration", with: 40
    click_button "Update Exercise"
  	expect(page).to have_content("Exercise has been updated")
    expect(page).to have_content(40)
    expect(page).not_to have_content(35)
	end
 
end
