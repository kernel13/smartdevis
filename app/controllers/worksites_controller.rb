class WorksitesController < InheritedResources::Base
   before_filter :authenticate_account!
   
   def new
        @worksite = Worksite.new
        @worksite.estimate_id = params[:estimate] if params[:estimate]
        
        respond_to do |format|
            format.js
        end 
   end
   
   def create
       @worksite = Worksite.new(params[:worksite])
       
       respond_to do |format|
         if @worksite.save
           format.html { redirect_to estimates_url, notice: 'worksite was successfully created.' }
           format.json { render json: @worksite, status: :created, location: @worksite }
         else
           format.html { render action: "new" }
           format.json { render json: @worksite.errors, status: :unprocessable_entity }
         end
       end  
   
   end
   
   def edit
     @worksite = Worksite.find(params[:id])
     
     respond_to do |format|
        format.js
     end
   end
   
   def destroy
        @worksite = Worksite.find(params[:id])
        @worksite.destroy

        respond_to do |format|
          format.js
          format.html { redirect_to worksites_url }
          format.json { head :no_content }
        end
    end
end
