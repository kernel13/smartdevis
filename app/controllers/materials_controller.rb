
class MaterialsController < InheritedResources::Base
   before_filter :authenticate_account!
   
   def index 
       @categories = Category.where(:parent_id => nil)
       @materials = Material.page(params[:page]).per(20).order("name asc")

       if params[:category]
          category = Category.where(:name => params[:category])            
          @materials = @materials.where(:category_id => category.first.id) if category
       end

        respond_to do |format|
          format.html 
          format.json { render json: @materials }
          format.js
        end
   end
   
   def edit
      @material = Material.find(params[:id])
   end

   # PUT /material/1
   # PUT /material/1.json
   def update
     @material = Material.find(params[:id])

     respond_to do |format|
       if @material.update_attributes(params[:material])
         format.html { redirect_to @material, notice: 'material was successfully updated.' }
         format.json { head :no_content }
         format.js
       else
         format.html { render action: "edit" }
         format.json { render json: @material.errors, status: :unprocessable_entity }
         format.js
       end
     end
   end

   # GET /materials/new
   # GET /materials/new.json
   def new
        @material = Material.new        
         
         respond_to do |format|
           format.html # new.html.erb
           format.json { render json: @material }
           format.js
         end
     end

 # POST /employees
 # POST /employees.json
  def create
     @material = Material.new(params[:material])       
     @materials = Material.page(params[:page]).per(10)

     respond_to do |format|
       if @material.save
         format.html { redirect_to @material, notice: 'Employee was successfully created.' }
         format.json { render json: @material, status: :created, location: @material }
         format.js
       else
         format.html { render action: "new" }
         format.json { render json: @material.errors, status: :unprocessable_entity }
         format.js           
       end
     end
   end

    # GET /material/1
   # GET /material/1.json
   def show
     @material = Material.find(params[:id])

     respond_to do |format|
       format.html # show.html.erb
       format.json { render json: @material }
       format.js
     end
   end
   
end


