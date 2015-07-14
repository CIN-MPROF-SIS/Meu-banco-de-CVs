Rails.application.routes.draw do
  resources :contratantes
  resources :vagas
  resources :usuarios
  resources :pessoas_juridicas
  resources :pessoas_fisicas
  resources :linguas
  resources :niveis
  resources :graus_formacao
  resources :faixas_salariais
  resources :municipios
  resources :unidades_federativas
  resources :faixas_salariais
  resources :candidatos
  resources :candidaturas, :except => [:show]
  get "getMunicipios"=>"pessoas_fisicas#getMunicipios"
  
  get 'signup'  => 'usuarios#new'
  
  get 'login'  => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout', :to => 'sessions#destroy'
  
  
  get '/ajuda',    :to => 'pages#ajuda'
  get '/contato', :to => 'pages#contato'
  get '/sobre',   :to => 'pages#sobre'
  
  
  get 'vagasdisponiveis'  => 'candidaturas#home'
  get 'candidaturas/:id'  => 'candidaturas#candidatar'
  get 'avaliarCandidatoVaga/:vaga_id'  => 'candidaturas#avaliarCandidatoVaga'
  #get 'candidaturas'  => 'candidaturas#index'
  #post 'candidaturas'  => 'candidaturas#create'
  #delete 'candidaturas/:id'  => 'candidaturas#destroy'
  
  get 'selecionarCandidatoVaga/:id'  => 'candidaturas#selecionar'
  
  root 'candidaturas#home'
  
  
  
  
  
  
  


 
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  #root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
