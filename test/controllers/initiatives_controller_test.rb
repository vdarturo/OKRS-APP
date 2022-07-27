require "test_helper"

class InitiativesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @initiative = initiatives(:one)
  end

  test "should get index" do
    get initiatives_url
    assert_response :success
  end

  test "should get new" do
    get new_initiative_url
    assert_response :success
  end

  test "should create initiative" do
    assert_difference("Initiative.count") do
      post initiatives_url, params: { initiative: { current_value: @initiative.current_value, description: @initiative.description, end_date: @initiative.end_date, key_result_id: @initiative.key_result_id, name: @initiative.name, owner_id: @initiative.owner_id, progress: @initiative.progress, start_date: @initiative.start_date, strat_value: @initiative.strat_value, target: @initiative.target, type_metric: @initiative.type_metric } }
    end

    assert_redirected_to initiative_url(Initiative.last)
  end

  test "should show initiative" do
    get initiative_url(@initiative)
    assert_response :success
  end

  test "should get edit" do
    get edit_initiative_url(@initiative)
    assert_response :success
  end

  test "should update initiative" do
    patch initiative_url(@initiative), params: { initiative: { current_value: @initiative.current_value, description: @initiative.description, end_date: @initiative.end_date, key_result_id: @initiative.key_result_id, name: @initiative.name, owner_id: @initiative.owner_id, progress: @initiative.progress, start_date: @initiative.start_date, strat_value: @initiative.strat_value, target: @initiative.target, type_metric: @initiative.type_metric } }
    assert_redirected_to initiative_url(@initiative)
  end

  test "should destroy initiative" do
    assert_difference("Initiative.count", -1) do
      delete initiative_url(@initiative)
    end

    assert_redirected_to initiatives_url
  end
end
