ActiveAdmin.register Company do

  form do |f|
       f.inputs :siret, :logo, :name

       f.inputs "address" do
          f.semantic_fields_for :address do |address_form|
            address_form.inputs :addressable_type, :addressable_id
            address_form.input :address_line1
          end
       end
      
       f.inputs "accounts" do
          f.has_many :accounts do |account_form|
            account_form.input :email
            account_form.input :password
            account_form.input :password_confirmation
          end         
        end

        f.actions
   end
    
end
