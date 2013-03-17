class InvoicesController < StatementsController
  defaults :resource_class => Invoice, :collection_name => 'resources', :instance_name => 'resource'

#Index action
  def index
    @resources = Invoice.page(params[:page]).per(15)
    
    index!
  end
  
  def show
    @resource = Invoice.find(params[:id])

    respond_to do |format|
        format.html
        format.pdf do
          pdf = StatementPdf.new(@resource, view_context)
          send_data pdf.render, filename: "invoice_#{@resource.id}.pdf",
                                type: "application/pdf",
                                disposition: "inline"                          
        end
    end
  end

  def edit
      @company = current_account.company
      @resource = Invoice.find(params[:id])
      @worksites = @resource.worksites
      @customer = @resource.customer || Customer.new
      @customer.address ||= Address.new        
      @resource.customer = @customer

      edit!
  end
  
  def update
    @resource = current_account.company.invoices.find(params[:id])
    
    respond_to do |format|
        if @resource.update_attributes(params[:invoice])
          format.html { redirect_to invoices_url, notice: 'invoice was successfully updated' }
          format.json { render json: @resource, status: :created, location: @resource }
        else
          format.html { render action: "edit" }
          format.json { render json: @resource.errors, status: :unprocessable_entity }
        end
    end
  end
  
  #new Action
  def new
      @resource = Invoice.new
      @resource.company_id = current_account.company.id

      respond_to do |format|
        if @resource.save
          format.html { redirect_to edit_invoice_path(@resource), notice: 'invoice was successfully created.' }
          format.json { render json: @resource, status: :created, location: @resource }
        else
          format.html { render action: "index" }
          format.json { render json: @resource.errors, status: :unprocessable_entity }
        end
      end
  end
  
  # POST /invoices
  # POST /invoice.json
  def create
    @resource = Invoice.new(params[:invoice])

    respond_to do |format|
      if @resource.save
        format.html { redirect_to invoices_url, notice: 'invoice was successfully created.' }
        format.json { render json: @resource, status: :created, location: @resource }
      else
        format.html { render action: "new" }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end
end
