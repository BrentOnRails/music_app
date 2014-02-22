MusicApp::Application.routes.draw do
  root :to => "bands#index"
  resources :users, :only => [:create, :new, :show]
  resource :session, :only => [:create, :destroy, :new]
  resources :bands do
    resources :albums, :only => [:create, :destroy, :new, :show] do
      resources :tracks, :only => [:create, :destroy, :new, :show]
    end
  end
end
