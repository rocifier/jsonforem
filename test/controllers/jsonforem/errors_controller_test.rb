require 'test_helper'

module Jsonforem
  class ErrorsControllerTest < ActionController::TestCase
    test "should get not_found" do
      get :not_found
      assert_response :success
    end

    test "should get exception" do
      get :exception
      assert_response :success
    end

  end
end
