class CustomersController < ApplicationController
  before_filter :authenticate_account!
   NB_ITERM_PER_PAGE = 1000
   
   # GET /customers
   # GET /customers.json
   def index
     
     if(params[:letter])
        @customers = current_account.company.customers.find(:all, :conditions => ["lower(customer_name) like ?", "#{params[:letter].downcase}%"], :include => :address)
        @customers = Kaminari.paginate_array(@customers).page(params[:page]).per(NB_ITERM_PER_PAGE)
     elsif(params[:customer_name])
        @customers = current_account.company.customers.where("lower(customer_name) like ?", "#{params[:customer_name].downcase}%")
        @customers = Kaminari.paginate_array(@customers).page(params[:page]).per(NB_ITERM_PER_PAGE)
      else
       @customers = current_account.company.customers.find(:all, :include => :address)
       @customers = Kaminari.paginate_array(@customers).page(params[:page]).per(NB_ITERM_PER_PAGE)
      end
      
      respond_to do |format|
          format.html # index.html.erb
          format.js
          format.json { render json: @customers, :include => :address }
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
           format.js
         end
     end

   # GET /customers/1/edit
   def edit
     @customer = current_account.company.customers.find(params[:id])
     @customer.address = Address.new unless @customer.address

      respond_to do |format|
           format.html # new.html.erb
           format.json { render json: @customer }
           format.js
         end
   end

   # POST /customers
   # POST /customers.json
    def create
       @customer = Customer.new(params[:customer])
       @customer.company = current_account.company
       
       respond_to do |format|
         if @customer.save
           format.html { redirect_to @customer, notice: 'customer was successfully created.' }
           format.json { render json: @customer, include: :address, status: :created, location: @customer }
           format.js
         else
           format.html { render action: "new" }
           format.json { render json: @customer.errors, status: :unprocessable_entity }
           format.js
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
         format.js
       else
         format.html { render action: "edit" }
         format.json { render json: @customer.errors, status: :unprocessable_entity }
         format.js
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
