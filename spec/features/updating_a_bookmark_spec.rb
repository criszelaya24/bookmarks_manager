feature 'Updating a bookmark' do
	scenario 'A user can update a bookmark' do
		bookmark = Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
		visit('/bookmarks')
		expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com')

		first('.edit').click_link('Edit')

		fill_in('url', with: "http://www.academy.com")
		fill_in('title', with: "Academy")
		click_button('Submit')

		#expect(page).not_to have_link('Makers Academy', href: 'http://www.makersacademy.com')
    	expect(page).to have_link('Academy', href: 'http://www.academy.com')
	end
end