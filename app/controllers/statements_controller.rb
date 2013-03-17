class StatementsController < InheritedResources::Base
  defaults :resource_class => Statement, :collection_name => 'resources', :instance_name => 'resource'
  before_filter :authenticate_account!

end
