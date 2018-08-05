Rails.application.routes.draw do
  root 'charges#index'

  get ':year/:month', to: 'charges#index'
  resources :charges, except: %i[ index ]
end
