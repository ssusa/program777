Rails.application.routes.draw do
  root to: "top#index"
  get "top/index", to: "top#index"

  namespace :others do
    get "about"
    get "toiawase"
    post "toiawase_send_mail"
  end

  namespace :samples do
    namespace :task_kanri do
      resources :tasks
    end
  end
end