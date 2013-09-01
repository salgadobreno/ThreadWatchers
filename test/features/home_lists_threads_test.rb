require "test_helper"

feature "Home lists threads" do
  before do
    @thread = create(:thred)
    @thread2 = create(:thred, :title => "two")
  end

  # As a visitor
  # I want site's threads displayed to me
  # so I can see which topics interest me
  it "lists threads" do
    visit root_path
    assert_content page, @thread.title
    assert_content page, @thread2.title
  end

  # Given I'm at home page
  # if I select a thread
  # I should be redirected to this threads page
  it "selects thread" do
    visit root_path
    click_on @thread.title
    assert page.find('h1').text, @thread.title
  end

end
