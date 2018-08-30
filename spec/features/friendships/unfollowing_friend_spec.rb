require "rails_helper"
RSpec.feature "Unfollow Friend Workout" do 
	before do
		@john = User.create!(first_name:"John",last_name:"Smith",email: "john@example.com", password: "password")
		login_as(@john)
    @sarah = User.create!(first_name:"Sarah",last_name:"Wang",email: "sarah@example.com", password: "password")
    login_as(@john)
    
    @following = Friendship.create(user:@john,friend: @sarah)
   
	end
  scenario "show a list of user's friends" do 

    visit "/"
    link="a[href='/friendships/#{@following.id}'][data-method='delete']"
    find(link).click
    expect(page).to have_content(@sarah.full_name+" unfollowed")
    
  end

end
