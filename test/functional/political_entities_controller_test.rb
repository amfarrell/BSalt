require 'test_helper'

class PoliticalEntitiesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:political_entities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create political_entity" do
    assert_difference('PoliticalEntity.count') do
      post :create, :political_entity => { }
    end

    assert_redirected_to political_entity_path(assigns(:political_entity))
  end

  test "should show political_entity" do
    get :show, :id => political_entities(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => political_entities(:one).to_param
    assert_response :success
  end

  test "should update political_entity" do
    put :update, :id => political_entities(:one).to_param, :political_entity => { }
    assert_redirected_to political_entity_path(assigns(:political_entity))
  end

  test "should destroy political_entity" do
    assert_difference('PoliticalEntity.count', -1) do
      delete :destroy, :id => political_entities(:one).to_param
    end

    assert_redirected_to political_entities_path
  end
end
