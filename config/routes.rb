TaxHelpr::Application.routes.draw do
  
  root :to => 'users#new'

  #scope "balance/:year/:month" do
    #match "" => "balances#show"
    #resources :incomes, :except => [:put]
    #resources :expenses, :except => [:put]
  #end  

  get "/balance/:year/:month" => "fiscal_months#show", :as => :balance

  resource :session, :except => ['show', 'update', 'edit']

  match '/login', :to => 'sessions#new', :as => 'login'
  match '/logout', :to => 'sessions#destroy', :as => 'logout'

  resources :users, :path_names => { :new => 'register', :edit => 'preferences' }, 
  :except => 'index', :constraints => { :id => /\d+/ }

end