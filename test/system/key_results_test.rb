require "application_system_test_case"

class KeyResultsTest < ApplicationSystemTestCase
  setup do
    @key_result = key_results(:one)
  end

  test "visiting the index" do
    visit key_results_url
    assert_selector "h1", text: "Key results"
  end

  test "should create key result" do
    visit key_results_url
    click_on "New key result"

    fill_in "Current value", with: @key_result.current_value
    fill_in "Description", with: @key_result.description
    fill_in "Name", with: @key_result.name
    fill_in "Objective", with: @key_result.objective_id
    fill_in "Owner", with: @key_result.owner_id
    fill_in "Period", with: @key_result.period
    fill_in "Progress", with: @key_result.progress
    fill_in "Strat value", with: @key_result.start_value
    fill_in "Target", with: @key_result.target
    fill_in "Type metric", with: @key_result.type_metric
    click_on "Create Key result"

    assert_text "Key result was successfully created"
    click_on "Back"
  end

  test "should update Key result" do
    visit key_result_url(@key_result)
    click_on "Edit this key result", match: :first

    fill_in "Current value", with: @key_result.current_value
    fill_in "Description", with: @key_result.description
    fill_in "Name", with: @key_result.name
    fill_in "Objective", with: @key_result.objective_id
    fill_in "Owner", with: @key_result.owner_id
    fill_in "Period", with: @key_result.period
    fill_in "Progress", with: @key_result.progress
    fill_in "Strat value", with: @key_result.start_value
    fill_in "Target", with: @key_result.target
    fill_in "Type metric", with: @key_result.type_metric
    click_on "Update Key result"

    assert_text "Key result was successfully updated"
    click_on "Back"
  end

  test "should destroy Key result" do
    visit key_result_url(@key_result)
    click_on "Destroy this key result", match: :first

    assert_text "Key result was successfully destroyed"
  end
end
