require 'test_helper'

class GnomesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gnomes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gnome" do
    assert_difference('Gnome.count') do
      post :create, :gnome => { }
    end

    assert_redirected_to gnome_path(assigns(:gnome))
  end

  test "should show gnome" do
    get :show, :id => gnomes(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => gnomes(:one).to_param
    assert_response :success
  end

  test "should update gnome" do
    put :update, :id => gnomes(:one).to_param, :gnome => { }
    assert_redirected_to gnome_path(assigns(:gnome))
  end

  test "should destroy gnome" do
    assert_difference('Gnome.count', -1) do
      delete :destroy, :id => gnomes(:one).to_param
    end

    assert_redirected_to gnomes_path
  end
end
