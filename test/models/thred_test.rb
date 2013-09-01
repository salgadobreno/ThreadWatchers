require "test_helper"

class ThredTest < ActiveSupport::TestCase

  def setup
    @thred = Thred.new
  end

  def test_thred_attributes
    assert_respond_to @thred, :title
    assert_respond_to @thred, :description
    assert_respond_to @thred, :posts
  end

  def test_thred_validates_presence_of_title
    refute @thred.valid?
    refute_empty @thred.errors[:title]
  end

  # default order => descending by date
  def test_threds_posts_order
    past_post = build(:post, start:Date.today - 10)
    present_post = build(:post, start:Date.today)
    future_post = build(:post, start:Date.today + 10)
    @thred = create(:thred, posts:[past_post, present_post, future_post])

    assert_equal @thred.reload.posts.map(&:id), [future_post.id, present_post.id, past_post.id]
  end

end
