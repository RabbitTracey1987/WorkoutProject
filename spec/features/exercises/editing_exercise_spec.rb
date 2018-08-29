require "rails_helper"
RSpec.feature "Editing Exercise" do 
	before do
		@john = User.create!(email: "john@example.com", password: "password")
    @john_exercise = @john.exercises.create!(duration_in_min:30,
                                              workout:"first activity",
                                              workout_date: Date.today)
		login_as(@john)
	end
	scenario "with valid data succeed" do 
    visit "/"
    click_link "My Lounge"
    path= "/user/#{@john.id}/exercises/#{@john_exercise.id}/edit"
    link= "a[href=\'#{path}\']"
    find(link).click_link
    fill_in "Duration", with 40
    click_button "Update Exercise"

  	expect(page).to have_content("Exercise has been updated")
    expect(page).to have_content(40)
    expect(page).not_to have_content(30)

	end
 
end
