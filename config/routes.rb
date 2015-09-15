TaintedView::Application.routes.draw do
  devise_for :users
  root "pages#home"

  resources :photos
  get '/admin', to: 'pages#admin'
end
