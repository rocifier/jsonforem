class User < ActiveRecord::Base
  def forum_admin?
    false
  end
end
