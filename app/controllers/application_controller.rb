class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :hardcode_json_format

private

  def hardcode_json_format
    request.format = :json
  end
end
