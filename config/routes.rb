Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  get "/phones" => "phones#index"
  post "/phones" => "phones#create"
  get "/phones/:id" => "phones#show"
  patch "/phones/:id" => "phones#update"
  delete "/phones/:id" => "phones#destroy"
end
