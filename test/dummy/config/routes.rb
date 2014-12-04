Rails.application.routes.draw do

  mount Jsonforem::Engine => "/jsonforem"

  match "/404" => "jsonforem/errors#not_found", via: :all
 
end
