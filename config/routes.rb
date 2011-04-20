I2db::Application.routes.draw do
  #resources :users

  #resources :revisions

  #resources :pages

  #resources :records

  #resources :tables
  
  scope '/api' do
    resources :records, :users, :revisions
  end
  
  match ':model(/:id(/:action))', :controller => "pages"
  match ':model(/:action)', :controller => "pages"
  match '/admin(/:model(/:action))', :controller => 'admin'
  match '/admin(/:model(/:id(/:action)))', :controller => 'admin'

  root :to => "pages#index"
end
