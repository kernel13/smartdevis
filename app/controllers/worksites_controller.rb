class WorksitesController < InheritedResources::Base
   before_filter :authenticate_account!
   
   def new
        @worksite = Worksite.new
        @worksite.statement_id = params[:statement] if params[:statement]
        
        respond_to do |format|
            format.js
        end 
   end
   
   def create
       @worksite = Worksite.new(params[:worksite])
       
       respond_to do |format|
         if @worksite.save
           format.html { redirect_to worksites_url, notice: 'worksite was successfully created.' }
           format.json { render json: @worksite, status: :created, location: @worksite }
           format.js
         else
           format.html { render action: "new" }
           format.json { render json: @worksite.errors, status: :unprocessable_entity }
           format.js
         end
       end  
   
   end
   
   def edit
     @worksite = Worksite.find(params[:id])
    
     respond_to do |format|
        format.html 
        format.json { render json: @worksite }
        format.js 
     end
   end

   # PUT /worksite/1
   # PUT /worksite/1.json
   def update
     @worksite = Worksite.find(params[:id])

     respond_to do |format|
       if @worksite.update_attributes(params[:worksite])
         format.html { redirect_to @worksite, notice: 'worksite was successfully updated.' }
         format.json { head :no_content }
         format.js
       else
         format.html { render action: "edit" }
         format.json { render json: @worksite.errors, status: :unprocessable_entity }
         format.js
       end
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
