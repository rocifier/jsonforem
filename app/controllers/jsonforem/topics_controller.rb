require_dependency "jsonforem/application_controller"

module Jsonforem
  class TopicsController < ApplicationController
    respond_to :json
    before_filter :load_resource, :only => [:show, :destroy, :update]

    # The following exception is raised from the model
    rescue_from ActionController::ParameterMissing do |e|
      param_missing(e)
    end

    def index
      respond_with Topic.all
    end

    def show
      respond_with @topic
    end

    def create
      if current_user.forum_admin?
        @topic = Topic.new(topic_params) 
        @topic.save
        respond_with @topic
      else
        respond_with({error: "User not authorized"}, status: 401)
      end
    end

    # PATCH/PUT /topics/1
    def update
      if current_user.forum_admin?
        @topic.update(topic_params)
        respond_with @topic
      else
        respond_with({error: "User not authorized"}, status: 401)
      end
    end

    # DELETE /topics/1
    def destroy
      if current_user.forum_admin?
        @topic.destroy
        respond_with @topic
      else
        respond_with({error: "User not authorized"}, status: 401)
      end
    end

    # GET /topics/:id/posts
    def posts
      posts = Post.where({:topic_id => params[:id], :post_id => nil}).order('created_at desc')
      if posts
        posts.each do |post|
          post.content = post.content[0..255]
        end
      end
      posts = '[]' if !posts
      respond_with posts
    end


    private
      def topic_params 
        params.require(:topic).permit(:title, :description, :forum_id)
      end

      def param_missing(e)
        render :json => {errors: e.message}, status: 400
      end

      def load_resource
        @topic = Topic.find(params[:id])
      end

  end
end

