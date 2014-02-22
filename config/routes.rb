MusicApp::Application.routes.draw do
  root :to => "bands#index"
  resources :users, :only => [:create, :new, :show]
  resource :session, :only => [:create, :destroy, :new]
  resources :bands do
    resources :albums, :only => [:create, :destroy, :new, :index, :show]
  end
  resources :tracks
end
