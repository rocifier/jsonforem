require "jsonforem/engine"

module Jsonforem
  mattr_accessor :user_class, :user_profile_links, :email_from_address,
                 :per_page, :sign_in_path, :moderate_first_post

    def user_class
      if @@user_class.is_a?(String)
        begin
          Object.const_get(@@user_class)
        rescue NameError
          @@user_class.constantize
        end
      end
    end

end
