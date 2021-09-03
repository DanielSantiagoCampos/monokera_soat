Rails.application.routes.draw do

  root to: "home#index"

  resources :admin do
    collection do
      get 'login', :to => "admin#login", :as => 'login'
      post 'sign_in', :to => "admin#sign_in", :as => 'sign_in'
    end
  end
  resources :soat do
    collection do
      get 'render_info_by_vehicle', :to => "soat#render_info_by_vehicle", :as => 'render_info_by_vehicle'
    end
  end

end
