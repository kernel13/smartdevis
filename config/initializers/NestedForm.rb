require 'nested_form/builder_mixin'

module NestedForm
  begin
    require 'twitter_bootstrap_form_for'
    class TwitterBootstrapBuilder < ::TwitterBootstrapFormFor::FormBuilder
      include ::NestedForm::BuilderMixin
    end
  rescue LoadError
  end
  
  module ViewHelper
    if defined?(TwitterBootstrapBuilder)
      def bootstrap_nested_form_for(*args, &block)        
        options = args.extract_options!.reverse_merge(:builder => NestedForm::TwitterBootstrapBuilder)
        form_for(*(args << options), &block) << after_nested_form_callbacks
      end
    end
  end
  
end