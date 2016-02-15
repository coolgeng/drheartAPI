Rails.application.routes.draw do
  # resources :users , defaults: {format: :json} , except: :edit
  # resources :heart_rates, defaults: {format: :json} , except: :edit
  # resources :doctors, defaults: {format: :json} , except: :edit
  # resources :patients,  defaults: {format: :json} , except: :edit
  
  # namespace :v1  do
 #    namespace :user do
 #      post 'login', to: 'users#login', defaults: {format: :json}
 #      post 'loginbytoken', to: 'users#loginbytoken', defaults: {format: :json}
 #      post 'resetpassword', to: 'users#resetpassword', defaults: {format: :json}
 #      post 'messagelist', to: 'users#messagelist', defaults: {format: :json}
 #      post 'getverifycode', to: 'users#getverifycode', defaults: {format: :json}
 #      post 'uploadavatar', to: 'users#uploadavatar', defaults: {format: :json}
 #    end
 #  end
 #
 #  namespace :v1  do
 #    namespace :patient do
 #      post 'register', to: 'patients#register', defaults: {format: :json}
 #      post 'userinfo', to: 'patients#show', defaults: {format: :json}
 #      post 'incidentlist', to: 'patients#incident_list',  defaults: {format: :json}
 #      post 'heartratelist', to: 'patients#heart_rate_list',  defaults: {format: :json}
 #      post 'doctorlist', to: 'patients#doctor_list',  defaults: {format: :json}
 #      post 'adddoctor', to: 'patients#add_doctor',  defaults: {format: :json}
 #      post 'removedoctor', to: 'patients#remove_doctor',  defaults: {format: :json}
 #      post 'searchdoctor', to: 'patients#search_doctor',  defaults: {format: :json}
 #      post 'uploadheartrate', to: 'patients#upload_heartrate', defaults: {format: :json}
 #    end
 #  end
 #
 #
 #  namespace :v1  do
 #    namespace :doctor do
 #      post 'register', to: 'doctors#register', defaults: {format: :json}
 #      post 'userinfo', to: 'doctors#show', defaults: {format: :json}
 #      post 'incidentlist', to: 'doctors#incident_list', defaults: {format: :json}
 #      post 'treat', to: 'doctors#treat', defaults: {format: :json}
 #      post 'patientlist', to: 'doctors#patient_list',  defaults: {format: :json}
 #      post 'accept', to: 'doctors#accept', defaults: {format: :json}
 #    end
 #  end
  
  post '/v1/user/login', to: 'users#login', defaults: {format: :json}
  post '/v1/user/loginbytoken', to: 'users#loginbytoken', defaults: {format: :json}
  post '/v1/user/resetpassword', to: 'users#reset_password', defaults: {format: :json}
  post '/v1/user/messagelist', to: 'users#message_list', defaults: {format: :json}
  post '/v1/user/getverifycode', to: 'users#get_verifycode', defaults: {format: :json}
  post '/v1/user/uploadavatar', to: 'users#uploadavatar', defaults: {format: :json}
  post '/v1/patient/register', to: 'users#register_patient', defaults: {format: :json}  
  post '/v1/doctor/register', to: 'users#register_doctor', defaults: {format: :json}
  
  
  post '/v1/patient/userinfo', to: 'patients#show', defaults: {format: :json}
  post '/v1/patient/incidentlist', to: 'patients#incident_list',  defaults: {format: :json}
  post '/v1/patient/heartratelist', to: 'patients#heart_rate_list',  defaults: {format: :json}
  post '/v1/patient/doctorlist', to: 'patients#doctor_list',  defaults: {format: :json}
  post '/v1/patient/adddoctor', to: 'patients#add_doctor',  defaults: {format: :json}
  post '/v1/patient/removedoctor', to: 'patients#remove_doctor',  defaults: {format: :json}
  post '/v1/patient/searchdoctor', to: 'patients#search_doctor',  defaults: {format: :json}
  post '/v1/patient/uploadheartrate', to: 'patients#upload_heartrate', defaults: {format: :json}


  post '/v1/doctor/userinfo', to: 'doctors#show', defaults: {format: :json}
  post '/v1/doctor/incidentlist', to: 'doctors#incident_list', defaults: {format: :json}
  post '/v1/doctor/treat', to: 'doctors#treat', defaults: {format: :json}
  post '/v1/doctor/patientlist', to: 'doctors#patient_list',  defaults: {format: :json}
  post '/v1/doctor/accept', to: 'doctors#accept', defaults: {format: :json}
    
  
  # match '/patients/heartratelist' => 'patients_controller#heart_rate_list', :as => 'heart_rate_list'
   
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
