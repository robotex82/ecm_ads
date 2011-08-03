Rails.application.routes.draw do |map|
  resources :ads, :controller => 'ecm/frontend/ads/ads', :only => [] do
    member do
      get :link
    end
  end
end
