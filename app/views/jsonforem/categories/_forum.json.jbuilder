json.title forum.title
json.description forum.description
json.postcount forum.posts.where({post_id: nil}).count        # top level posts
json.messagecount forum.posts.count                           # posts + replies
if forum.posts.count > 0
  json.latestpost forum.posts.order("created_at desc").limit(1), partial: 'jsonforem/topics/post'
  #post = forum.posts.order("created_at desc").first
  #render partial: 'jsonforem/topics/post', locals: {json: :json}
end
