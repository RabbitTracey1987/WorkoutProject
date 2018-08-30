require "rails_helper"
RSpec.feature "Showing Friend Workout" do 
	before do
		@john = User.create!(first_name:"John",last_name:"Smith",email: "john@example.com", password: "password")
    @sarah = User.create!(first_name:"Sarah",last_name:"Wang",email: "sarah@example.com", password: "password")
   
    @e1=@john.exercises.create(duration_in_min:20,
                               workout:"My body exercise1",
                               workout_date:Date.today)
      
    @e2=@sarah.exercises.create(duration_in_min:50,
                               workout:"Weight lifting",
                               workout_date:2.days.ago)

    login_as(@john)
    @following = Friendship.create(user:@john,friend: @sarah)
   
	end
  scenario "show a list of user's friends" do 
    visit "/"
    click_link "My Lounge"
    click_link @sarah.full_name
    expect(page).to have_content(@sarah.full_name+"'s Exercises")
    expect(page).to have_content(@e2.workout)
    expect(page).to have_css("div#chart")
  end

end
