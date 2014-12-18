json.title category.title
json.description category.description
json.forumcount category.forums.count
if category.forums.count > 0
  json.forums category.forums.order("created_at desc"), partial: 'jsonforem/categories/forum', as: :forum
end
