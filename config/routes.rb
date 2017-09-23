Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :words
      resources :grid_boxes
    end
  end

end
