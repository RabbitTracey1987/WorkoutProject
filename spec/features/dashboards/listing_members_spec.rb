require "rails_helper"
RSpec.feature "Listing Members" do 
	before do
		@john = User.create!(first_name:"Jone",
                         last_name: "Smith",
                         email: "john@example.com", 
                         password: "password")
    @sarah = User.create!(first_name:"Sarah",
                         last_name: "Doe",
                         email: "sarah@example.com", 
                         password: "password")
    
	end
	scenario "show a lit of registed members" do 
    visit "/"
    expect(page).to have_content("List of Members")
    expect(page).to have_content(@john.full_name)
    expect(page).to have_content(@sarah.full_name)
	end
 
end
