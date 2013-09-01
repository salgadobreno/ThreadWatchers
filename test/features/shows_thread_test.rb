require "test_helper"

feature "ShowsThread" do
  before do
    @thread = create(:thred_with_posts, :description => 'zxcv')
    visit thred_path @thread
  end

  # Given I'm at the Thread page

  it "lists thread's entries" do
    @thread.posts.each do |p|
      assert_content page, p.title
      assert_content page, p.link
    end
  end

  it "displays thread's description" do
    assert_content page, @thread.description
  end

  it "displays timeline" do
    assert_selector "#timeline" #?
  end

end
