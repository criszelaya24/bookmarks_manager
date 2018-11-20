feature 'Viewing bookmarks' do
	scenario 'Visiting the index page' do
		visit('/')
		expect(page).to have_content("Bookmarks Manager")
	end
end

feature 'Viewing bookmarks' do
	scenario 'A user can see bookmarks' do
		visit('/bookmarks')
	  	expect(page).to have_content "http://www.makersacademy.com"
	    expect(page).to have_content "http://www.askjeeves.com"
	    expect(page).to have_content "http://www.google.com"
	end
end