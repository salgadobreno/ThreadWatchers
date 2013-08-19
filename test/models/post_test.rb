require "test_helper"

class PostTest < ActiveSupport::TestCase

  def setup
    @post = Post.new
  end

  def test_post_attributes
    assert_respond_to @post, :title
    assert_respond_to @post, :summary
    assert_respond_to @post, :url
    assert_respond_to @post, :date
  end

  def test_post_validations
    refute @post.valid?
    refute_empty @post.errors[:title]
    refute_empty @post.errors[:url]
    refute_empty @post.errors[:date]
  end

end
