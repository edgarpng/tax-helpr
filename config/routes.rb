TaxHelpr::Application.routes.draw do
  
  root :to => 'sessions#new'

  scope ":year" do
    scope ":month" do
      resources :incomes, except: :put
      resources :expenses, except: :put
    end
  end

  resources :users, path_names: { new: 'sign-up', edit: 'preferences' }, 
  except: 'index', constraints: { id: /\d+/ }

  resource :session, except: ['show', 'update', 'edit']

  match '/login', to: 'sessions#new', as: 'login', via: :get
  match '/logout', to: 'sessions#destroy', as: 'logout', via: :post
  match '/users/sign-up', :to => 'users#new', as: 'sign_up', via: :get
end