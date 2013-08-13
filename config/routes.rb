PracticeProject::Application.routes.draw do
  resources :users
  resources :followings
  resource :session
end
