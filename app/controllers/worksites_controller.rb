class WorksitesController < InheritedResources::Base
   before_filter :authenticate_account!
end
