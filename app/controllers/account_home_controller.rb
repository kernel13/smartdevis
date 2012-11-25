class AccountHomeController < ApplicationController
   before_filter :authenticate_account!
   
    def index
        @company = current_account.company
        logger.info "================= " + @company.name
    end
end
