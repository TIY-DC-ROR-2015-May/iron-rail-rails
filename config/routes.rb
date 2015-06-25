Rails.application.routes.draw do
  get '/v1' => 'stations#index'
end
