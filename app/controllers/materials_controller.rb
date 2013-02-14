class MaterialsController < InheritedResources::Base
   before_filter :authenticate_account!
   
   def index
       @categories = Category.where(:parent_id => nil)
       @materials = Material.page(params[:page]).per(10)
       
        respond_to do |format|
          format.html 
          format.json { render json: @materials }
          format.js
        end
   end
end
