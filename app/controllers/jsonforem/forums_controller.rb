require_dependency "jsonforem/application_controller"

module Jsonforem
  class ForumsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    def index
      respond_with Forum.all
    end

    def show
      render :json => Forum.find(params[:id]), status: 200
    end

    # GET /forums/:id/topics
    def topics
      topics = Topics.find_by(:jsonforem_forums_id => params[:id])
      render :json => topics, status: 200
    end

    private
      def record_not_found
        render :json => '{ "error": "Forum with id=' + params[:id] + ' not found." }', status: 404
      end

  end
end
