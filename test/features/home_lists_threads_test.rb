require "test_helper"

feature "Home lists threads" do
  before do
    @thread = create(:thred)
    @thread2 = create(:thred, :name => "two")
  end

  # As a visitor
  # I want site's threads displayed to me
  # so I can see which topics interest me
  it "lists threads" do
    visit root_path
    assert_content page, @thread.name
    assert_content page, @thread2.name
  end

  # Given I'm at home page
  # if I select a thread
  # I should be redirected to this threads page
  it "selects thread" do
    visit root_path
    click_on @thread.name
    assert page.find('h1').text, @thread.name
  end

end
