Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'game#reset'
  get '/landing' => 'game#landing'
  post '/landing' => 'game#landing'
  get '/game' => 'game#try'
  get '/new_game' => 'game#reset'
end
