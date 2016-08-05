Rails.application.routes.draw do
  get '/employees' => 'employees#index'
  get '/employees/:id' => 'employees#show'
end
