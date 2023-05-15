Rails.application.routes.draw do
  #get 'blogs/index'
  #get 'blogs/show'

  # resources :blogs
  # resources :projects
  resources :projects, :blogs

  resources :courses

  # Defines the root path route ("/")
  root "welcome#index"
  get "welcome/index"
  #resources :welcomes

  #get "welcome/about"
  #get "/about/" => 'welcome#about'
  #root "welcome#index"

  resources :students

  # resources :students do
  #   member do
  #     get :personal_details
  #   end
  #   collection do
  #     get :active
  #   end
  # end

  #get :personal_details, on: :member  #this is only one member action of resource

  # member routes require id of a resource to perform an action like for (show, edit, update, destroy)
  # so it is the show, edit, update, destroy it is member action because it need id to perform action
  # collection routes does not require id of resource like (index, create, new)

  get "students/test"   #custom routes

  namespace :admin do
    resources :students
  end


end
