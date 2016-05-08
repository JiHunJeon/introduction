require 'test_helper'

class CoverLettersControllerTest < ActionController::TestCase
  setup do
    @cover_letter = cover_letters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cover_letters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cover_letter" do
    assert_difference('CoverLetter.count') do
      post :create, cover_letter: { text: @cover_letter.text }
    end

    assert_redirected_to cover_letter_path(assigns(:cover_letter))
  end

  test "should show cover_letter" do
    get :show, id: @cover_letter
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cover_letter
    assert_response :success
  end

  test "should update cover_letter" do
    patch :update, id: @cover_letter, cover_letter: { text: @cover_letter.text }
    assert_redirected_to cover_letter_path(assigns(:cover_letter))
  end

  test "should destroy cover_letter" do
    assert_difference('CoverLetter.count', -1) do
      delete :destroy, id: @cover_letter
    end

    assert_redirected_to cover_letters_path
  end
end
