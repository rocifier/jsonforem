require_dependency "jsonforem/application_controller"

module Jsonforem
  class PostsController < ApplicationController
    respond_to :json
    before_filter :load_resource, :only => [:show, :destroy, :update]
    before_filter :authenticate_author, except: :show
    before_filter :ensure_post_ownership!, :only => [:destroy, :update]

    # The following exception is raised from the model
    rescue_from ActionController::ParameterMissing do |e|
      param_missing(e)
    end

    # GET /posts
    def index
      respond_with Post.all, status: 200
    end

    # POST /posts
    def create
      @post = Post.new(post_params) 
      @post.save
      respond_with @post
    end

    # PATCH/PUT /posts/1
    def update
      @post.update(post_params)
      respond_with @post
    end

    # DELETE /posts/1
    def destroy
      @post.destroy
      respond_with @post
    end

    # GET /posts/1
    def show
      respond_with @post
    end

    def childrenof
      children = Post.where(jsonforem_posts_id: params[:id])
      respond_with children, status: 200
    end


    private
      def load_resource
        @post = Post.find(params[:id])
      end

      def post_params
        params.require(:post).permit(:title, :content, :jsonforem_topics_id, :jsonforem_posts_id)
      end

      def ensure_post_ownership!
        unless @post.owner_or_admin? current_user
          render :json => {error: "User not authorized"}, status: 401
        end
      end

      def param_missing(e)
        render :json => {errors: e.message}, status: 400
      end

  end
end

