require_dependency "jsonforem/application_controller"

module Jsonforem
  class PostsController < ApplicationController
    respond_to :json
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    before_filter :load_resource, :only => [:show, :destroy, :update]
    before_filter :authenticate_author, except: :show
    before_filter :ensure_post_ownership!, :only => [:destroy, :update]

    # GET /posts
    def index
      respond_with Post.all, status: 200
    end

    # POST /posts
    def create
      @post = Post.new(post_params) 

      if @post.save
        respond_with @post.to_json, status: 200
      else
        respond_with @post.errors.to_json, status: 500
      end
    end

    # PATCH/PUT /posts/1
    def update
      @post.update(post_params)
      respond_with
    end

    # DELETE /posts/1
    def destroy
      @post.destroy
      respond_with
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
      def record_not_found
        render :json => {error: "Post with id=#{params[:id]} not found."}, status: 404
      end

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

  end
end

