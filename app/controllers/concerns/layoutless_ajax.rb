module LayoutlessAjax
  extend ActiveSupport::Concern

  included do
    layout :layout

    def layout
      request.xhr? ? false : 'application'
    end
  end
end
