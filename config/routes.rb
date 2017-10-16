Rails.application.routes.draw do

  root 'sessions#new'
   resources :pessoas
   get    'sign_in'   => 'sessions#new'
   post   'sign_in'   => 'sessions#create'
   delete 'sign_out'  => 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
