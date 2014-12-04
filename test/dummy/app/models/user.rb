class User < ActiveRecord::Base
  def forum_admin?
    true
  end
end
