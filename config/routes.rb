Rails.application.routes.draw do
   root 'it_assets#index'
   resources :it_assets
   resources :locations
   resources :manufacturers
end
