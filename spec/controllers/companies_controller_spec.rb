require 'spec_helper'

valid_attributes = {
  :siret => '11111111111111', :name => "company1"
  }
# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe CompaniesController do

  before(:each) do
      @company = create(:company)
      sign_in @company.accounts.first
  end

  describe "GET index" do
    it "assigns all companies as @companies" do
       #Company.create! valid_attributes
      get :index
      response.should redirect_to(@company)
    end
  end

  describe "GET show" do
    it "assigns the requested company as @company" do
      get :show, {:id => @company.to_param}
      assigns(:company).should eq(@company)
    end
    
    it "Should show only current user company" do
        company = create(:company2)
        get :show, {:id => company.to_param}
        assigns(:company).should eq(@company)  
    end
  end

  # describe "GET new" do
  #    it "assigns a new company as @company" do
  #      get :new
  #      response.should_not be_success
  #    end
  #  end

  describe "GET edit" do
    it "assigns the requested company as @company" do      
      get :edit, {:id => @company.to_param}
      assigns(:company).should eq(@company)
    end
  end

  # describe "POST create" do
  #    describe "with valid params" do
  #      it "creates a new Company" do
  #        expect {
  #          post :create, {:company => valid_attributes}, valid_session
  #        }.to change(Company, :count).by(1)
  #      end
  # 
  #      it "assigns a newly created company as @company" do
  #        post :create, {:company => valid_attributes}, valid_session
  #        assigns(:company).should be_a(Company)
  #        assigns(:company).should be_persisted
  #      end
  # 
  #      it "redirects to the created company" do
  #        post :create, {:company => valid_attributes}, valid_session
  #        response.should redirect_to(Company.last)
  #      end
  #    end
  # 
  #    describe "with invalid params" do
  #      it "assigns a newly created but unsaved company as @company" do
  #        # Trigger the behavior that occurs when invalid params are submitted
  #        Company.any_instance.stub(:save).and_return(false)
  #        post :create, {:company => {}}, valid_session
  #        assigns(:company).should be_a_new(Company)
  #      end
  # 
  #      it "re-renders the 'new' template" do
  #        # Trigger the behavior that occurs when invalid params are submitted
  #        Company.any_instance.stub(:save).and_return(false)
  #        post :create, {:company => {}}, valid_session
  #        response.should render_template("new")
  #      end
  #    end
  #  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested company" do
        # Assuming there are no other companies in the database, this
        # specifies that the Company created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Company.any_instance.should_receive(:update_attributes).with({"name" => 'company'})
        @company.name = 'company'
        put :update, {:id => @company.to_param, :company => {"name" => 'company'}}
      end

      it "assigns the requested company as @company" do        
        put :update, {:id => @company.to_param, :company => valid_attributes}
        assigns(:company).should eq(@company)
      end

      it "redirects to the company" do
        put :update, {:id => @company.to_param, :company => valid_attributes}
        response.should redirect_to(@company)
      end
    end

    describe "with invalid params" do
      it "assigns the company as @company" do
        # Trigger the behavior that occurs when invalid params are submitted
        Company.any_instance.stub(:save).and_return(false)
        put :update, {:id => @company.to_param, :company => {}}
        assigns(:company).should eq(@company)
      end

      it "re-renders the 'edit' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Company.any_instance.stub(:save).and_return(false)
        put :update, {:id => @company.to_param, :company => {}}
        response.should render_template("edit")
      end
    end
  end

  # describe "DELETE destroy" do
  #    it "destroys the requested company" do
  #      expect {
  #        delete :destroy, {:id => @company.to_param}
  #      }.to change(Company, :count).by(-1)
  #    end
  # 
  #    it "redirects to the companies list" do      
  #      delete :destroy, {:id => @company.to_param}
  #      response.should redirect_to(companies_url)
  #    end
  #  end

end