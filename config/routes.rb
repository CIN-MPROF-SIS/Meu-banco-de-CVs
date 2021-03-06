Rails.application.routes.draw do
  resources :moderadores
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
  resources :usuarios
  resources :candidaturas, :except => [:show]
  resources :questionarios
  get "getMunicipios"=>"candidatos#getMunicipios"
  #get "manual_usuario"=>"pages#manualUsuario"
  get '/manual_usuario', :to => redirect('/manuais/manual_usuario/manual_usuario.html')
  get '/manual_administrador', :to => redirect('/manuais/manual_administrador/manual_administrador.html')
  
  get 'signup'  => 'usuarios#new'
  
  get 'login'  => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout', :to => 'sessions#destroy'
  
  get '/ajuda',    :to => 'pages#ajuda'
  get '/contato', :to => 'pages#contato'
  get '/sobre',   :to => 'pages#sobre'
  
  get 'vagasdisponiveis'  => 'candidaturas#home'
  get 'candidaturas/:id'  => 'candidaturas#candidatar'
  
  get 'ultimasvagas'  => 'vagas#home'
  
  
  get 'questionarios/vaga/:id'  => 'questionarios#index'
  get 'questionarios/new/:id'  => 'questionarios#new'
  get 'questionarios/responder/:id'  => 'questionarios#responder'
  post 'questionarios/responder/create'  => 'questionarios#salvarrespostas'
  
  get 'avaliarCandidatoVaga/:vaga_id'  => 'candidaturas#avaliarCandidatoVaga'
  get 'selecionarCandidatoVaga/:id'  => 'candidaturas#selecionar'
  get 'candidaturas/questionario/:id'  => 'candidaturas#mostrarNotasQuestionario'
  
  get 'autorizarContratantes'  => 'usuarios#autorizarContratante'
  get 'aprovarContratante/:id'  => 'usuarios#aprovarContratante' 
  get 'reprovarContratante/:id'  => 'usuarios#reprovarContratante' 
  
  get 'resumoPerfilContratante/:id'  => 'contratantes#resumo' 
  
  
  
  root 'pages#home'
  
 
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
