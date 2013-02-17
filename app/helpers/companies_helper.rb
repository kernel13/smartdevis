module CompaniesHelper
  def resource_name
      :account
    end
   
    def resource
      account ||= Account.new
    end

    def devise_mapping
       @devise_mapping ||= Devise.mappings[:account]
     end
end
