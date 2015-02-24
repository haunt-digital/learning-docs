class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  after_filter :flash_to_headers


  def render *args
    # Handling for parsing the flash into headers
    # even when sending a chunked response.
    flash_to_headers
    super

    # Forcing discard which was broken for streamed
    # responses.
    # Try to only set the flash from post/put/del
    if request.get?
      flash.discard
    end
  end


  def flash_to_headers
    return unless request.xhr?
    return if response.headers['X-Redirect-Requested']

    unless flash.empty?
      response.headers['X-Flash-Present'] = true;

      flash.each do |k,v|
        header_key = 'X-Flash-Message-' + k.gsub('_', '-').titlecase.gsub(' ', '-')
        response.headers[header_key] = v
      end

      flash.discard
    end
  end


  def client_redirect(path)
    response.headers['X-Redirect-Requested'] = true;
    response.headers['X-Redirect-Path'] = path;
  end
end
