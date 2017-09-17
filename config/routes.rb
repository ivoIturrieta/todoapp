Rails.application.routes.draw do
  root "pages#home"
  get "/about", to: "pages#about"
  get "/help", to: "pages#help"
  
  resources :todos
end
