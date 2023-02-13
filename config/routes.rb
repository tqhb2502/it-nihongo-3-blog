Rails.application.routes.draw do
  
  devise_for :authors
  get 'authors/show'
  
  get 'home/index'
  root to: "home#index"
  
  scope module: 'authors' do
    resources :posts do
      resources :elements do
        member do
          patch :move
        end
      end
      get :show
    end
  end
  
end
