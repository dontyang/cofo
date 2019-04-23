Rails.application.routes.draw do
  devise_for :employees
  root to: 'home#index'

  post 'baidu/ocr_idcard', to: 'baidu#ocr_idcard'
  resources :projects
  resources :workers
  resources :worker_hours
end
