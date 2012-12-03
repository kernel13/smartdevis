class MaterialsController < InheritedResources::Base
   before_filter :authenticate_account!
   
   def index
       @categories = Category.where(:parent_id => nil)
       @materials = Material.all
       
        respond_to do |format|
          format.html 
          format.json { render json: @materials }
        end
   end
end
