Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations', sessions: 'sessions'}
  root 'home#home_page'
   resources :home do
        collection do
          post 'import'
          get 'home_page'
          get 'supplier_products/:supplier_id/:supplier_name', to: "home#supplier_products"
      end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
