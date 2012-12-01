class CustomersController < ApplicationController
  before_filter :authenticate_account!
  
   # GET /customers
   # GET /customers.json
   def index
     if(params[:letter])
        @customers = current_account.company.customers.find(:first, :conditions => ["lower(last_name) like ?", "#{params[:letter].downcase}%"])
     else
       @customers = current_account.company.customers
     end
          
      respond_to do |format|
          format.html # index.html.erb
          format.js
          format.json { render json: @companies }
        end
   end

   # GET /customers/1
   # GET /customers/1.json
   def show
     @customer = current_account.company.customers.find(params[:id])

     respond_to do |format|
       format.html # show.html.erb
       format.js
       format.json { render json: @customer }
     end
   end

   # GET /customers/new
   # GET /customers/new.json
   def new
        @customer = Customer.new
        @customer.company = current_account.company
        @customer.address = Address.new
        
         respond_to do |format|
           format.html # new.html.erb
           format.json { render json: @customer }
         end
     end

   # GET /customers/1/edit
   def edit
     @customer = current_account.company.customers.find(params[:id])
     @customer.address = Address.new unless @customer.address
   end

   # POST /customers
   # POST /customers.json
    def create
       @customer = Customer.new(params[:customer])
       @customer.company = current_account.company
       
       respond_to do |format|
         if @customer.save
           format.html { redirect_to @customer, notice: 'customer was successfully created.' }
           format.json { render json: @customer, status: :created, location: @customer }
         else
           format.html { render action: "new" }
           format.json { render json: @customer.errors, status: :unprocessable_entity }
         end
       end
     end

   # PUT /customers/1
   # PUT /customers/1.json
   def update
     @customer = current_account.company.customers.find(params[:id])

     respond_to do |format|
       if @customer.update_attributes(params[:customer])
         format.html { redirect_to @customer, notice: 'customer was successfully updated.' }
         format.json { head :no_content }
       else
         format.html { render action: "edit" }
         format.json { render json: @customer.errors, status: :unprocessable_entity }
       end
     end
   end

   # DELETE /customers/1
   # DELETE /customers/1.json
   def destroy
         @customer = current_account.company.customers.find(params[:id])
         @customer.destroy
     
         respond_to do |format|
           format.html { redirect_to customers_url }
           format.json { head :no_content }
         end
       end
end
