Rails.application.routes.draw do
  devise_for :employees

  root to: 'home#index'
  post 'baidu/ocr_idcard', to: 'baidu#ocr_idcard'

  resources :projects
  resources :workers, except: [:show, :destroy]
  resources :worker_hours, except: [:show]
  resources :worker_advances, except: [:show]
  resources :worker_settles, only: [:index, :new, :create] do
    collection do
      get :to_be_settled
    end
  end

end
