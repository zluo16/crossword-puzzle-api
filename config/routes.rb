Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      get '/puzzles/generate', to: 'puzzles#random_gen'

      resources :words
      resources :grid_boxes
      resources :puzzle_words
      resources :puzzles
    end
  end

end
