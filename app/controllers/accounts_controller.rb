class AccountsController < ApplicationController
  before_filter :authenticate_account!

  # GET /accounts
  # GET /accounts.json
  def index
    @accounts = Account.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @accounts }
    end
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show
    @account = Account.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @account }
    end
  end

  # GET /accounts/new
  # GET /accounts/new.json
  def new
    @account = Account.new
    @account.company_id = current_account.company.id
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @account }
      format.js
    end
  end

  # GET /accounts/1/edit
  def edit
    @account = Account.find(params[:id])
  end

  # POST /accounts
  # POST /accounts.json
  def create
    @account = Account.new(params[:account])
    @account.company_id = current_account.company.id
 
    respond_to do |format|
      if @account.save
        format.html { redirect_to @account, notice: 'account was successfully created.' }
        format.json { render json: @account, status: :created, location: @account }
        format.js
      else
        format.html { render action: "new" }
        format.json { render json: @account.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PUT /accounts/1
  # PUT /accounts/1.json
  def update
    @account = Account.find(params[:id])
    current_account_id = current_account.id
    
    respond_to do |format|
      if @account.update_attributes(params[:account])        
        sign_in @account, :bypass => true if @account.id == current_account_id
        format.html { redirect_to @account.company, notice: 'account was successfully updated.' }
        format.json { head :no_content }
        format.js
      else
        format.html { render action: "edit" }
        format.json { render json: @account.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    @account = Account.find(params[:id])
    @account.destroy

    respond_to do |format|
      format.html { redirect_to accounts_url }
      format.json { head :no_content }
      format.js
    end
  end
end
