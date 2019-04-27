Rails.application.routes.draw do
  devise_for :employees

  root to: 'home#index'
  post 'baidu/ocr_idcard', to: 'baidu#ocr_idcard'

  resources :projects, only: [:index, :show, :new, :create] do
    collection do
      get :basic_info
      get :worker
      get :material
      get :claiming
      get :report
    end
  end
  resources :workers, except: [:show, :destroy]
  resources :worker_hours, except: [:show]
  resources :worker_advances, except: [:show]
  resources :worker_settles, only: [:index, :show, :new, :create] do
    collection do
      get :to_be_settled
    end
  end
  resources :vendors, except: [:show, :destroy]
  resources :materials

end
