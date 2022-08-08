require "application_system_test_case"

class LikesTest < ApplicationSystemTestCase
  test "liking a tweet" do
    user = create(:user)
    tweet1 = create(:tweet, user: user, body: "first tweet")
    _tweet2 = create(:tweet, user: user, body: "second tweet")

    visit root_path(as: user)

    click_on "Like this tweet (#{tweet1.likes.count})", match: :first
    assert_text "You have liked this tweet."
    assert_text "Unlike this tweet (#{tweet1.likes.count})"

    click_on "Back"
    assert_selector "h1", text: "Tweets"
  end

  test "unliking a tweet" do
    user = create(:user)
    tweet1 = create(:tweet, user: user, body: "first tweet")

    visit root_path(as: user)

    click_on "Like this tweet (#{tweet1.likes.count})", match: :first
    assert_text "You have liked this tweet."

    click_on "Unlike this tweet (#{tweet1.likes.count})", match: :first
    assert_text "You have unliked this tweet."
    assert_text "Like this tweet (#{tweet1.likes.count})"

    click_on "Back"
    assert_selector "h1", text: "Tweets"
  end
end