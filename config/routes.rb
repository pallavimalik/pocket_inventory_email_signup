PocketInventorySignup::Application.routes.draw do
  get 'visitors/index'
  get 'visitors/create'
  post 'visitors/signup'
  get 'visitors/multiple' => 'visitors#multiple'
  get 'clear_db' => 'visitors#clear_db'
  get 'pixel' => 'visitors#pixel'
  post '/multiple_post' => 'visitors#multiple_post'
  match 'signup_analysis' => 'visitors#signup_analysis', via: [:get]
end
