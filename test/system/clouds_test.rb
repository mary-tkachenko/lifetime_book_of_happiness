require "application_system_test_case"

class CloudsTest < ApplicationSystemTestCase
  setup do
    @cloud = clouds(:one)
  end

  test "visiting the index" do
    visit clouds_url
    assert_selector "h1", text: "Clouds"
  end

  test "creating a Cloud" do
    visit clouds_url
    click_on "New Cloud"

    fill_in "Image", with: @cloud.image_id
    fill_in "Post", with: @cloud.post_id
    fill_in "Tag", with: @cloud.tag_id
    click_on "Create Cloud"

    assert_text "Cloud was successfully created"
    click_on "Back"
  end

  test "updating a Cloud" do
    visit clouds_url
    click_on "Edit", match: :first

    fill_in "Image", with: @cloud.image_id
    fill_in "Post", with: @cloud.post_id
    fill_in "Tag", with: @cloud.tag_id
    click_on "Update Cloud"

    assert_text "Cloud was successfully updated"
    click_on "Back"
  end

  test "destroying a Cloud" do
    visit clouds_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Cloud was successfully destroyed"
  end
end
