Rails.application.routes.draw do
    root 'sessions#new'

    resources :calouros
    resources :servidores do
      resources :rfids
    end
   resources :pessoas
   resources :alunos do
     resources :rfids
   end
   resources :salas do
     resources :horarios
   end
   resources :professores do
     resources :rfids
   end
   resources :rfids, only: [:index] #only for api
   resources :administradores
   get    'sign_in'   => 'sessions#new'
   post   'sign_in'   => 'sessions#create'
   delete 'sign_out'  => 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
