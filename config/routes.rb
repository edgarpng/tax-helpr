TaxHelpr::Application.routes.draw do
  
  root :to => 'sessions#new'

  scope ":year" do
    scope ":month" do
      resources :incomes, except: :put
      resources :expenses, except: :put
    end
  end

  get "/:year/:month", to: 'fiscal_months#show', as: 'fiscal_month',
  constraints: { year: /\d{4}/, month: /\d{1,2}/}

  resources :users, path_names: { new: 'sign-up', edit: 'preferences' }, 
  except: 'index', constraints: { id: /\d+/ }

  resource :session, except: ['show', 'update', 'edit']

  get '/login', to: 'sessions#new', as: 'login'
  post '/logout', to: 'sessions#destroy', as: 'logout'
  get '/users/sign-up', :to => 'users#new', as: 'sign_up'
end