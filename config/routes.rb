Rails.application.routes.draw do
    #管理者アカウント
    devise_for :admins, controllers: {
      registrations: 'admins/registrations',
      sessions: 'admins/sessions'
    }
    resources :admins, only: [:show]

    root to: 'tops#index' #トップページ
    get 'download' => 'tops#download' #事務資料ダウンロード
    get 'lp' => 'tops#lp' #事務資料ダウンロード
    
    resources :contracts do
      resource :comments
      collection do
        post :confirm
        post :thanks
      end
      member do
        post :send_mail
        #post :send_mail_start #開始日の送信
        get "info" #案内
        get "conclusion"
        #get "payment" 
        #get "calendar"
        #get "start"
      end
    end
  

    resources :jobs

    resources :sfas do
      resources :progresses
      collection do
        post :confirm
        post :thanks
      end
    end

    get 'lp' => 'tops#lp'

    #get '*path', controller: 'application', action: 'render_404'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
