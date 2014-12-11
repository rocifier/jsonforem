require_dependency "jsonforem/application_controller"

module Jsonforem
  class CategoriesController < ApplicationController
    respond_to :json
    before_filter :load_resource, :only => [:show, :destroy, :update]

    def index
      @categories = Category.includes(:forums)
      categories_hash = Hash.new
      
      @categories.each do |category|
        categories_hash[category.title] = category.forums
      end

      respond_with categories_hash
    end

    def show
      respond_with @category
    end

    def create
      if current_user.forum_admin?
        @category = Category.new(category_params) 
        @category.save
        respond_with @category
      else
        respond_with({error: "User not authorized"}, status: 401)
      end
    end

    # PATCH/PUT /categories/1
    def update
      if current_user.forum_admin?
        @category.update(category_params)
        respond_with @category
      else
       respond_with({error: "User not authorized"}, status: 401)
      end
    end

    # DELETE /categories/1
    def destroy
      if current_user.forum_admin?
        @category.destroy
        respond_with @category
      else
        respond_with({error: "User not authorized"}, status: 401)
      end
    end

    # GET /categories/:id/forums
    def forums
      forums = Forum.where(:category_id => params[:id])
      forums = '[]' if !forums
      respond_with forums
    end

    

    private
      def category_params
        params.require(:category).permit(:title, :description)
      end

      def load_resource
        @category = Category.find(params[:id])
      end

  end
end
