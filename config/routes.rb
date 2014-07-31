NflDraft::Application.routes.draw do

  resources :rounds
  
  resources :picks

  resources :players
  match "/player/:permalink" => "players#show", as: :player_permalink
  match "/team/:permalink" => "teams#show", as: :team_permalink

  resources :teams
  
  root to: 'picks#index'
end
