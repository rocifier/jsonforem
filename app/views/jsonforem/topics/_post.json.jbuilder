if defined? post.attachments
  json.attachments post.attachments do |attachment|
    json.url url_for(attachment)
  end
end
json.stats do
  json.replies Jsonforem::Post.where({:post_id => post.id}).count
  json.views 0
  json.age time_ago_in_words(post.created_at)
end
json.author do
  json.id post.user.id
  json.isadmin post.user.forum_admin?
end
json.created_at post.created_at
json.updated_at post.updated_at
json.lastreply Jsonforem::Post.where({:post_id => post.id}).order("created_at desc").first
json.title post.title
json.content RedCloth.new( post.content, [:filter_styles, :filter_classes, :filter_ids] ).to_html
json.id post.id
