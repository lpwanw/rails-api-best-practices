Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      resources :blogs, only: %i[index show create update]
      resources :users, only: [] do
        collection do
          get :me
          post :sign_in, :refresh, :revoke
        end
      end
    end
  end

  mount Rswag::Ui::Engine => "/api-docs"
  mount Rswag::Api::Engine => "/api-docs"
end
