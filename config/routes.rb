Rails.application.routes.draw do
  if ENV['UNSAFE_PRODUCTION'] == 'true' || Rails.env.development?
    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  end

  devise_for :users, :controllers => {sessions: 'sessions', registrations: 'registrations'}
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

  resources :external_resources, only: [:show]

  resources :skills, only: [:show] do
    resources :tasks, only: [:show] do
      post 'complete', :on => :member, as: :task_complete
      post 'redo', :on => :member, as: :task_redo
    end
  end

  resources :competencies, only: [:show] do
    post 'subscribe', :on => :member, as: :subscribe
    post 'unsubscribe', :on => :member, as: :unsubscribe
  end

  # post 'tasks/:id/complete' => 'tasks#mark_complete', as: :task_complete
  # post 'tasks/:id/redo' => 'tasks#mark_redo', as: :task_redo

  # get 'skills/:id' => 'skills#show', as: :skill do
  #   get 'tasks/:id' => 'tasks#show', as: :task
  # end

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
