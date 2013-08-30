require "test_helper"

feature "ShowsThread" do
  before do
    @thread = create(:thred_with_posts)
  end

  # Given I'm at the Thread page
  # I should see thread entries
  it "lists thread's entries" do
    visit thred_path @thread
    @thread.posts.each do |p|
      assert_content page, p.title
      assert_content page, p.url
    end
  end
end
