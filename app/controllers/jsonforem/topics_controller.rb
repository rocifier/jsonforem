require_dependency "jsonforem/application_controller"

module Jsonforem
  class TopicsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    def index
      respond_with Forum.all
    end

    def show
      render :json => Forum.find(params[:id]), status: 200
    end

    # GET /topics/:id/posts
    def posts
      toplevelposts = Post.where(jsonforem_topics_id: params[:id], jsonforem_posts_id: nil)
      render :json => toplevelposts, status: 200
    end

    private
      def record_not_found
        render :json => '{ "error": "Topic with id=' + params[:id] + ' not found." }', status: 404
      end

  end
end
