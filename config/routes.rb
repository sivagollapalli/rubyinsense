Rubyinsense::Application.routes.draw do
  match '/auth/:provider/callback' => 'home#create'
  devise_for :users, :controllers => {:registrations => 'registrations'}

  resources :questions do
    collection do
      get 'my_questions'
    end
  end
  root :to => 'home#index'
end
