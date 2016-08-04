Rails.application.routes.draw do
  get '/employees/:id' => 'employees#show'
end
