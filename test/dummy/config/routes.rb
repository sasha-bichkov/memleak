Rails.application.routes.draw do

  mount Memleak::Engine => "/memleak"
end
