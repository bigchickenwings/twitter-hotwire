require "application_system_test_case"

class TweetsTest < ApplicationSystemTestCase
  test "visiting the index" do
    user = create(:user)
    _tweet1 = create(:tweet, user: user, body: "first tweet")
    _tweet2 = create(:tweet, user: user, body: "second tweet")
    _tweet3 = create(:tweet, user: user, body: "third tweet")

    visit root_path(as: user)

    assert_selector "h1", text: "Tweets"
  end

  test "should create tweet" do
    user = create(:user)
    visit tweets_path(as: user)

    fill_in "What's on your mind?", with: "first tweet"
    click_on "Create Tweet"

    assert_text "first tweet"
  end

  test "should update Tweet" do
    user = create(:user)
    tweet = create(:tweet, user: user)
    visit root_path(as: user)
    visit tweet_path(tweet)

    click_on "Edit this tweet", match: :first

    fill_in "What's on your mind?", with: "updated tweet"
    click_on "Update Tweet"

    assert_text "updated tweet"
  end

  test "should destroy Tweet" do
    user = create(:user)
    tweet = create(:tweet, user: user)
    visit root_path(as: user)

    click_on "Delete", match: :first

    assert_selector "p", text: "first tweet", count: 0
  end
end
