TaxHelpr::Application.routes.draw do
  
  root :to => 'users#new'

  #scope "balance/:year/:month" do
    #match "" => "balances#show"
    #resources :incomes, :except => [:put]
    #resources :expenses, :except => [:put]
  #end  

  get "/balance/:year/:month" => "fiscal_months#show", :as => :balance do
    resources :incomes, :except => [:put]
    resources :expenses, :except => [:put]
  end

  resource :session, :except => ['show', 'update', 'edit']

  match '/login', :to => 'sessions#new', :as => 'login', :via => :get
  match '/logout', :to => 'sessions#destroy', :as => 'logout', :via => :post

  resources :users, :path_names => { :new => 'register', :edit => 'preferences' }, 
  :except => 'index', :constraints => { :id => /\d+/ }

end