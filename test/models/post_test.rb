require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

   test "text and author is correct" do
    assert_equal('First post by noora@noora.com', posts(:first_post).title_and_author)
  end
end
