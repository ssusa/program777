Rails.application.routes.draw do
  root to: "top#index"
  get "top/index", to: "top#index"

  namespace :others do
    get "about"
    get "link"
    get "toiawase"
    post "toiawase_send_mail"
  end

  namespace :samples do
    namespace :task_kanri do
      resources :tasks do
        member do
          get "kanryo"
        end
      end
    end
  end

  get "articles/:yyyymm/:yyyymmdd", to: "articles#show"
end

