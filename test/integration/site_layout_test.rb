require "test_helper"

class SiteLayoutTest < ActionDispatch::IntegrationTest
  test "layout links" do
    get root_path
    assert_template "static_pages/home"
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path

    get contact_path
    assert_select "title", full_title("Contact")

    get signup_path
    assert_select "title", full_title("Sign up")

    log_in_as(users(:michael))
    get users_path
    assert_select "title", full_title("All users")
    assert_select "a[href=?]", user_path(users(:michael))
    assert_select "a[href=?]", user_path(users(:archer))
    assert_select "a[href=?]", "https://news.railstutorial.org/"
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
  end
end
