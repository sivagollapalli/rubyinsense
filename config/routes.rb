Rubyinsense::Application.routes.draw do
  match '/auth/:provider/callback' => 'home#create'
  devise_for :users, :controllers => {:registrations => 'registrations'}

  resources :questions do
    collection do
      get 'my_questions'
    end
    resources :answers
    resources :comments, only: [:create, :destroy]
  end
  root :to => 'questions#index'
end
