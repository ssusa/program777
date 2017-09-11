Rails.application.routes.draw do
  root to: "top#index"
  get "top/index", to: "top#index"
end