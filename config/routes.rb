TaxHelpr::Application.routes.draw do
  
  root :to => 'users#new'

  scope "balance/:year/:month" do
    match "" => "balances#show"
    resources :incomes, :except => [:put]
    resources :expenses, :except => [:put]
  end  

  resource :session, :path_names => { :new => 'login', :create => 'login', :destroy => 'logout'},
  :except => ['show', 'update', 'edit']

  match '/login', :to => 'sessions#new'
  match '/logout', :to => 'sessions#destroy'

  resources :users, :path_names => { :new => 'register', :edit => 'preferences' }, 
  :except => 'index', :constraints => { :id => /\d+/ }

end