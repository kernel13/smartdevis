class MaterialsController < InheritedResources::Base
   before_filter :authenticate_account!
   
   def index
       @categories = Category.where(:parent_id => nil)
       
       index!
   end
end
