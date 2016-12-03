Memleak::Engine.routes.draw do
  root to: 'memleak#index'
  get '*path', to: 'memleak#index'
end
