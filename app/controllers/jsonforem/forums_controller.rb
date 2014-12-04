require_dependency "jsonforem/application_controller"

module Jsonforem
  class ForumsController < ApplicationController
    respond_to :json
    before_filter :load_resource, :only => [:show, :destroy, :update]

    # The following exception is raised from the model
    rescue_from ActionController::ParameterMissing do |e|
      param_missing(e)
    end

    def index
      respond_with Forum.all
    end

    def show
      respond_with @forum
    end

    def create
      if current_user.forum_admin?
        @forum = Forum.new(forum_params) 
        @forum.save
        respond_with @forum
      else
        respond_with({error: "User not authorized"}, status: 401)
      end
    end

    # PATCH/PUT /forums/1
    def update
      if current_user.forum_admin?
        @forum.update(forum_params)
        respond_with @forum
      else
        respond_with({error: "User not authorized"}, status: 401)
      end
    end

    # DELETE /forums/1
    def destroy
      if current_user.forum_admin?
        @forum.destroy
        respond_with @forum
      else
        respond_with({error: "User not authorized"}, status: 401)
      end
    end

    # GET /forums/:id/topics
    def topics
      topics = Topic.find_by(:jsonforem_forums_id => params[:id])
      topics = '[]' if !topics
      respond_with topics
    end


    private
      def forum_params 
        params.require(:forum).permit(:title, :description, :jsonforem_categories_id)
      end

      def param_missing(e)
        render :json => {errors: e.message}, status: 400
      end

      def load_resource
        @forum = Forum.find(params[:id])
      end

  end
end
