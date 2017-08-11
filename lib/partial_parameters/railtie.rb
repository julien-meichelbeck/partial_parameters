require 'rails/railtie'

module PartialParameters
  class Railtie < ::Rails::Railtie
    initializer 'partial_parameters.action_view' do
      ActiveSupport.on_load :action_view do
        require 'partial_parameters/action_view/helpers'
        include PartialParameters::ActionView::Helpers
      end
    end
  end
end
