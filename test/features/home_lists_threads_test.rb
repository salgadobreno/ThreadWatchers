require "test_helper"

class HomeListsThreadsTest < Capybara::Rails::TestCase
  def setup
    DatabaseCleaner[:mongoid].start

    @thread = create(:thred)
    @thread2 = create(:thred, :name => "two")
  end

  # As a visitor
  # I want site's threads displayed to me
  # so I can see which topics interest me
  def test_homepage_lists_threads
    visit root_path
    save_and_open_page
    assert_content page, @thread.name
    assert_content page, @thread2.name
  end

  def teardown
    DatabaseCleaner[:mongoid].clean
  end
end
