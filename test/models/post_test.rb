require "test_helper"

class PostTest < ActiveSupport::TestCase

  def setup
    @post = Post.new
  end

  def test_post_attributes
    assert_respond_to @post, :title
    assert_respond_to @post, :description
    assert_respond_to @post, :link
    assert_respond_to @post, :start
  end

  def test_post_has_image
    skip
    assert_respond_to @post, :image
  end

  def test_post_validations
    refute @post.valid?
    refute_empty @post.errors[:title]
    refute_empty @post.errors[:link]
    refute_empty @post.errors[:start]
  end

end
