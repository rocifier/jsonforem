Jsonforem::Engine.routes.draw do

  mount Jsonforem::Engine => '/forum'
  resources :posts, :categories, :forums, :topics

  get 'posts/:id/comments' => 'posts#childrenof'
  get 'categories/:id/forums' => 'categories#forums'
  get 'forums/:id/topics' => 'forums#topics'
  get 'topics/:id/posts' => 'topics#posts'
  post 'posts/search' => 'posts#find'

  root 'posts#index'

end
