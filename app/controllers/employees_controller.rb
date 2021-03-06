class EmployeesController < ApplicationController
  before_filter :authenticate_account!
  
   # GET /employees
   # GET /employees.json
   def index
     @employees = current_account.company.employees
    
      respond_to do |format|
          format.html # index.html.erb
          format.json { render json: @employees }
        end
   end

   # GET /employees/1
   # GET /employees/1.json
   def show
     @employee = current_account.company.employees.find(params[:id])

     respond_to do |format|
       format.html # show.html.erb
       format.json { render json: @employee }
       format.js
     end
   end

   # GET /employees/new
   # GET /employees/new.json
   def new
        @employee = Employee.new
        @employee.company = current_account.company
         
         respond_to do |format|
           format.html # new.html.erb
           format.json { render json: @employee }
           format.js
         end
     end

   # GET /employees/1/edit
   def edit
     @employee = current_account.company.employees.find(params[:id])
   end

   # POST /employees
   # POST /employees.json
    def create
       @employee = Employee.new(params[:employee])
       @employee.company = current_account.company
    
       respond_to do |format|
         if @employee.save
           format.html { redirect_to @employee, notice: 'Employee was successfully created.' }
           format.json { render json: @employee, status: :created, location: @employee }
           format.js
         else
           format.html { render action: "new" }
           format.json { render json: @employee.errors, status: :unprocessable_entity }
           format.js           
         end
       end
     end

   # PUT /employees/1
   # PUT /employees/1.json
   def update
     @employee = current_account.company.employees.find(params[:id])

     respond_to do |format|
       if @employee.update_attributes(params[:employee])
         format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
         format.json { head :no_content }
         format.js
       else
         format.html { render action: "edit" }
         format.json { render json: @employee.errors, status: :unprocessable_entity }
         format.js
       end
     end
   end

   # DELETE /employees/1
   # DELETE /employees/1.json
   def destroy
         @employee = current_account.company.employees.find(params[:id])
         @employee.destroy
     
         respond_to do |format|
           format.html { redirect_to employees_url }
           format.json { head :no_content }
         end
       end
end
