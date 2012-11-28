ActiveAdmin.register Company do  
  
  # Index
  index :as => :table do |company|
     column :id
     column :logo do |c|
       image_tag(c.logo_url(:thumb).to_s)
      end
      column :company_name
      
      default_actions
      
  end
  
  # Show
  show do |company|
    
    attributes_table do
      row :company_name
      row :id
      row :siret
      row :logo do
          image_tag(company.logo_url.to_s)
      end
      row :created_at
      row :updated_at
    end
    
    panel "Address" do
        attributes_table_for company.address do
            row :address_line1
            row :address_line2
            row :city
            row :postal_code
            row :email
            row :phone
        end
    end
    
    panel "Accounts" do
        table_for company.accounts do |account|
            column do |a|
              a.email              
            end
            column :last_sign_in_at
            column :last_sign_in_ip
            column :created_at
            column :updated_at
        end
    end
    
  end
  
  # Form
  form(:html => {:multipart => true}) do |f|

    f.inputs :siret, :company_name, :logo, :as => :file

    f.inputs "address" do
          f.semantic_fields_for :address do |address_form|
              address_form.input :addressable_type, :as => :hidden
              address_form.input :addressable_id, :as => :hidden
              address_form.inputs :address_line1, :address_line2, :city, :postal_code, :phone, :email 
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
  
  # Controller
  controller do
    
    def new
      @company = Company.new
      @address = @company.address = Address.new
      
      new!
    end
  end
end
