require_dependency "jsonforem/application_controller"

module Jsonforem
  class CategoriesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    def index
      respond_with Category.all
    end

    def show
      render :json => Category.find(params[:id]), status: 200
    end

    # GET /categories/:id/forums
    def forums
      forums = Forums.find_by(:jsonforem_categories_id => params[:id])
      render :json => forums, status: 200
    end

    private
      def record_not_found
        render :json => '{ "error": "Category with id=' + params[:id] + ' not found." }', status: 404
      end

  end
end
