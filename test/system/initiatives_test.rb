require "application_system_test_case"

class InitiativesTest < ApplicationSystemTestCase
  setup do
    @initiative = initiatives(:one)
  end

  test "visiting the index" do
    visit initiatives_url
    assert_selector "h1", text: "Initiatives"
  end

  test "should create initiative" do
    visit initiatives_url
    click_on "New initiative"

    fill_in "Current value", with: @initiative.current_value
    fill_in "Description", with: @initiative.description
    fill_in "End date", with: @initiative.end_date
    fill_in "Key result", with: @initiative.key_result_id
    fill_in "Name", with: @initiative.name
    fill_in "Owner", with: @initiative.owner_id
    fill_in "Progress", with: @initiative.progress
    fill_in "Start date", with: @initiative.start_date
    fill_in "Strat value", with: @initiative.strat_value
    fill_in "Target", with: @initiative.target
    fill_in "Type metric", with: @initiative.type_metric
    click_on "Create Initiative"

    assert_text "Initiative was successfully created"
    click_on "Back"
  end

  test "should update Initiative" do
    visit initiative_url(@initiative)
    click_on "Edit this initiative", match: :first

    fill_in "Current value", with: @initiative.current_value
    fill_in "Description", with: @initiative.description
    fill_in "End date", with: @initiative.end_date
    fill_in "Key result", with: @initiative.key_result_id
    fill_in "Name", with: @initiative.name
    fill_in "Owner", with: @initiative.owner_id
    fill_in "Progress", with: @initiative.progress
    fill_in "Start date", with: @initiative.start_date
    fill_in "Strat value", with: @initiative.strat_value
    fill_in "Target", with: @initiative.target
    fill_in "Type metric", with: @initiative.type_metric
    click_on "Update Initiative"

    assert_text "Initiative was successfully updated"
    click_on "Back"
  end

  test "should destroy Initiative" do
    visit initiative_url(@initiative)
    click_on "Destroy this initiative", match: :first

    assert_text "Initiative was successfully destroyed"
  end
end
