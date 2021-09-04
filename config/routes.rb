Rails.application.routes.draw do

  root to: "home#index"

  namespace :admin do
    resources :orders
  end

  resources :admin do
    collection do
      get 'login', :to => "admin#login", :as => 'login'
      post 'sign_in', :to => "admin#sign_in", :as => 'sign_in'
    end
  end

  resources :soat do
    collection do
      get 'get_tariffs_by_type',    :to => "soat#get_tariffs_by_type",    :as => 'get_tariffs_by_type'
      get 'render_info_by_vehicle', :to => "soat#render_info_by_vehicle", :as => 'render_info_by_vehicle'
      get 'render_shooping_cart',   :to => "soat#render_shooping_cart",   :as => 'render_shooping_cart'
      get 'render_payment',         :to => "soat#render_payment",         :as => 'render_payment'
      get 'send_notification',      :to => "soat#send_notification",      :as => 'send_notification'
    end
  end

end
