Rails.application.routes.draw do
  root 'calculations#index'
  resources :calculations, only: %i[show new create index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
