MusicApp::Application.routes.draw do
  root :to => "bands#index"
  resources :users, :only => [:create, :new, :show]
  resource :session, :only => [:create, :destroy, :new]
  resources :bands
  resources :albums
  resources :tracks
end
