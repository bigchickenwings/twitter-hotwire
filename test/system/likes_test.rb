require "application_system_test_case"

class LikesTest < ApplicationSystemTestCase
  test "liking a tweet" do
    user = create(:user)
    _tweet1 = create(:tweet, user: user, body: "first tweet")
    tweet2 = create(:tweet, user: user, body: "second tweet")

    visit root_path(as: user)
    click_on "Like this tweet (#{tweet2.likes.count})", match: :first

    assert_text "Unlike this tweet (#{tweet2.likes.count})"
    assert_equal 1, tweet2.likes.count
  end

  test "unliking a tweet" do
    user = create(:user)
    tweet1 = create(:tweet, user: user, body: "first tweet")

    visit root_path(as: user)

    click_on "Like this tweet (#{tweet1.likes.count})", match: :first

    assert_text "Unlike this tweet (#{tweet1.likes.count})"
    assert_equal 1, tweet1.likes.count

    click_on "Unlike this tweet (#{tweet1.likes.count})", match: :first

    assert_text "Like this tweet (#{tweet1.likes.count})"
    assert_equal 0, tweet1.likes.count
  end
end