Memleak::Engine.routes.draw do

  root to: 'memleak#index'

  resources :snapshots

end
