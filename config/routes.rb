Spree::Core::Engine.add_routes do
  namespace :admin, path: Spree.admin_path do
    resources :reports, only: [:index] do
      collection do
        get :export_to_quickbooks
        post :export_to_quickbooks
      end
    end
  end
end
