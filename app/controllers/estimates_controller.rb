class EstimatesController < InheritedResources::Base
  
  #Index action
  def index
    @estimates = Estimate.page(params[:page]).per(15)
    
    index!
  end
  
  def edit
      @company = current_account.company
      @estimate = Estimate.find(params[:id])
      @worksites = @estimate.worksites
      @customer = @estimate.customer || Customer.new
      @customer.address ||= Address.new  
           
      edit!
  end
  
  def update
    @estimate = current_account.company.estimates.find(params[:id])
    
    respond_to do |format|
        if @estimate.update_attributes(params[:estimate])
          format.html { redirect_to estimates_url, notice: 'estimate was successfully updated' }
          format.json { render json: @estimate, status: :created, location: @estimate }
        else
          format.html { render action: "edit" }
          format.json { render json: @estimate.errors, status: :unprocessable_entity }
        end
    end
  end
  
  #new Action
  def new
      @estimate = Estimate.new
      @estimate.company_id = current_account.company.id
      
      respond_to do |format|
        if @estimate.save
          format.html { redirect_to edit_estimate_path(@estimate), notice: 'estimate was successfully created.' }
          format.json { render json: @estimate, status: :created, location: @estimate }
        else
          format.html { render action: "index" }
          format.json { render json: @estimate.errors, status: :unprocessable_entity }
        end
      end
  end
  
  # POST /estimates
  # POST /estimates.json
  def create
    @estimate = Estimate.new(params[:estimate])

    respond_to do |format|
      if @estimate.save
        format.html { redirect_to estimates_url, notice: 'estimate was successfully created.' }
        format.json { render json: @estimate, status: :created, location: @estimate }
      else
        format.html { render action: "new" }
        format.json { render json: @estimate.errors, status: :unprocessable_entity }
      end
    end
  end
  
end
