module Jsonforem
  user_class = "User"

  class ApplicationController < ::ApplicationController
    def authenticate_author
      if current_user == nil
        render :json => {error: 'No current user'}, status: 401
      end
    end
    def forem_admin
      current_user && current_user.forum_admin?
    end
  end
end
