class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  after_filter :flash_to_headers

  def flash_to_headers
    return unless request.xhr?

    unless flash.empty?
      response.headers['X-Flash-Message-Present'] = true;

      ['error', 'warning', 'notice', 'success'].each do |type|
        unless flash[type].blank?
          header_key = 'X-Flash-Message-' + type.titlecase
          response.headers[header_key] = flash[type]
        end
      end

      flash.discard
    end
  end
end
