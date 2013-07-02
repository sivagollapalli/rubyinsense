Rubyinsense::Application.routes.draw do
  match '/auth/:provider/callback' => 'home#create'
  devise_for :users, :controllers => {:registrations => 'registrations'}

  resources :questions do
    resources :answers
  end
  root :to => 'home#index'
end
