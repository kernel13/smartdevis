class DashboardController < ApplicationController
  before_filter :authenticate_account!
  
  def index
      @company = current_account.company
      @latest_estmates = @company.estimates.order("updated_at desc").take(5)
      @latest_customers = @company.customers.order("created_at desc").take(5)
  end
end
