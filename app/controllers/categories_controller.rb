class CategoriesController < ApplicationController
  before_filter :authenticate_account!
  
   # GET /employees
   # GET /employees.json
   def index
    # @categories = Category.all
     @categories = Category.where(:parent_id => nil)
     
      respond_to do |format|
          format.html # index.html.erb
          format.json { render json: @categories }
        end
   end

   # GET /employees/1
   # GET /employees/1.json
   def show
     @category = Category.find(params[:id])

     respond_to do |format|
       format.html # show.html.erb
       format.json { render json: @categories }
     end
   end

   # GET /employees/new
   # GET /employees/new.json
   def new
        @category = Category.new(:parent_id => params[:parent_id])
         
         respond_to do |format|
           format.html # new.html.erb
           format.json { render json: @categories }
         end
     end

   # GET /employees/1/edit
   def edit
     @category = Category.find(params[:id])
   end

   # POST /employees
   # POST /employees.json
    def create
       @category = Category.new(params[:category])
    
       respond_to do |format|
         if @category.save
           format.html { redirect_to @category, notice: 'Category was successfully created.' }
           format.json { render json: @category, status: :created, location: @category }
         else
           format.html { render action: "new" }
           format.json { render json: @category.errors, status: :unprocessable_entity }
         end
       end
     end

   # PUT /employees/1
   # PUT /employees/1.json
   def update
     @category = Category.find(params[:id])

     respond_to do |format|
       if @category.update_attributes(params[:category])
         format.html { redirect_to @category, notice: 'Employee was successfully updated.' }
         format.json { head :no_content }
       else
         format.html { render action: "edit" }
         format.json { render json: @category.errors, status: :unprocessable_entity }
       end
     end
   end

   # DELETE /employees/1
   # DELETE /employees/1.json
   def destroy
         @category = Category.find(params[:id])
         @category.destroy
     
         respond_to do |format|
           format.html { redirect_to categories_url }
           format.json { head :no_content }
         end
       end
end
