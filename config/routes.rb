Rails.application.routes.draw do
  
  #Feature has been removed due to errors
  #post '/posts/:id/request_contact', to: 'posts#request_contact', as: 'request_contact'
  resources :profiles do
     resources :reviews, :except => [:show, :index] 
  end
  devise_for :users
  #get 'pages/index'

  #Removing the following routes:
  # profile_reviews GET    /profiles/:profile_id/reviews(.:format)          reviews#index
  # Reason, profile reviews are displayed in /profiles/:profile_id
  get '/profiles/:profile_id/reviews', to: redirect('/profiles/:profile_id')
  # profile_review GET    /profiles/:profile_id/reviews/:id(.:format)      reviews#show
  # Reason, not needed to display one particular view
  get '/profiles/:profile_id/reviews/:id', to: redirect('/profiles/:profile_id')
  # posts GET    /posts(.:format)                                           posts#index  
  #Redirected to the home page where /posts actually is
  get '/posts', to: redirect('/')
  


  get 'contact', to:'pages#contact'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  post 'contact_seller', to: 'posts#contact_seller'

  post 'request_contact', to: 'pages#request_contact'
  # Post controller -> Index view as root
  # get '/', to 'posts#index'
  root 'posts#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  resources :posts

  

end
