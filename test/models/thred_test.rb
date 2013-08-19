require "test_helper"

class ThredTest < ActiveSupport::TestCase

  def setup
    @thred = Thred.new
  end

  def test_thred_attributes
    assert_respond_to @thred, :name
    assert_respond_to @thred, :description
    assert_respond_to @thred, :posts
  end

  def test_thred_validates_presence_of_name
    refute @thred.valid?
    refute_empty @thred.errors[:name]
  end

end
