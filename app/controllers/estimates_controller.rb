class EstimatesController < StatementsController
  defaults :resource_class => Estimate, :collection_name => 'resources', :instance_name => 'resource'

#Index action
  def index
    @resources = Estimate.page(params[:page]).per(15)
    
    index!
  end
  
  def show
    @resource = Estimate.find(params[:id])
    
    respond_to do |format|
        format.html
        format.pdf do
          pdf = StatementPdf.new(@resource, view_context)
          send_data pdf.render, filename: "estimate_#{@resource.id}.pdf",
                                type: "application/pdf",
                                disposition: "inline"                          
        end
    end
  end

  def edit
      @company = current_account.company
      @resource = Estimate.find(params[:id])
      @worksites = @resource.worksites
      @customer = @resource.customer || Customer.new
      @customer.address ||= Address.new        
      @resource.customer = @customer

      edit!
  end
  
  def update
    @resource = current_account.company.estimates.find(params[:id])
    
    respond_to do |format|
        if @resource.update_attributes(params[:estimate])
          format.html { redirect_to estimates_url, notice: 'estimate was successfully updated' }
          format.json { render json: @resource, status: :created, location: @resource }
        else
          format.html { render action: "edit" }
          format.json { render json: @resource.errors, status: :unprocessable_entity }
        end
    end
  end
  
  #new Action
  def new
      @resource = Estimate.new
      @resource.company_id = current_account.company.id

      respond_to do |format|
        if @resource.save
          format.html { redirect_to edit_estimate_path(@resource), notice: 'estimate was successfully created.' }
          format.json { render json: @resource, status: :created, location: @resource }
        else
          format.html { render action: "index" }
          format.json { render json: @resource.errors, status: :unprocessable_entity }
        end
      end
  end
  
  # POST /estimates
  # POST /estimates.json
  def create
    @resource = Estimate.new(params[:estimate])

    respond_to do |format|
      if @resource.save
        format.html { redirect_to estimates_url, notice: 'estimate was successfully created.' }
        format.json { render json: @resource, status: :created, location: @resource }
      else
        format.html { render action: "new" }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end
end
