Memleak::Engine.routes.draw do
  root to: 'memleak#index'
  get 'snapshots', to: 'memleak#snapshots'
end
