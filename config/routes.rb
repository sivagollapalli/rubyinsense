Rubyinsense::Application.routes.draw do
  match '/auth/:provider/callback' => 'home#create'
  devise_for :users, :controllers => {:registrations => 'registrations', :sessions => 'sessions'}

  scope 'api' do
    resources :questions do
      collection do
        get 'my_questions'
        get 'vote'
      end
      post 'rating', on: :member
      resources :answers
      resources :comments, only: [:create, :destroy]
    end
  end
  root :to => 'home#index'
end
