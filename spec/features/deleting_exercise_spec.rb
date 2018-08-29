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
    path= "/users/#{@john.id}/exercises/#{@john_exercise.id}"
    link= "//a[contains(@href,\'#{path}\') and .//text()='Destroy']"
    find(:xpath,link).click
    
  	expect(page).to have_content("Exercise has been deleted")
	end
 
end
