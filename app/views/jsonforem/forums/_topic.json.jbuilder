json.title topic.title
json.description topic.description
json.postcount topic.posts.where({post_id: nil}).count        # top level posts
json.messagecount topic.posts.count                           # posts + replies
json.id topic.id
if topic.posts.count > 0
  json.latestpost topic.posts.order("created_at desc").limit(1), partial: 'jsonforem/topics/post'
end
