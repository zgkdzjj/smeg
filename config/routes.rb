Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
    devise_for :users, :controllers => {  :sessions => "sessions",
                                          :registrations => "registrations",
                                          :passwords => "passwords"
                                         }

     unauthenticated :user do
       root to: 'pages#index', id: 'index'
     end

    devise_scope :user do
      get "login",  to: "sessions#new"
      get "logout", to: "sessions#destroy"
      get "register", to: "devise/registrations#new"

      authenticate :user, lambda {|u| u.admin? } do
        root to: 'products#index', as: :authenticated_admin
      end
    end

  resources :products do
    member do
      get :history
    end
  end
  resources :features

  resource :searchable, only: [] do
    collection do
      get :features
    end
  end

  root to: 'pages#index'

  mount API::Base => '/'
  mount GrapeSwaggerRails::Engine => '/apidoc'

end
