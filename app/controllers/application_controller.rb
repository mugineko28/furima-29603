class ApplicationController < ActionController::Base
  before_action :basic_auth


  private

  def basic_auth
    authenticare_or_request_with_http_basic do |username, password|
      username == 'hinomoto' && password == '1896'
    end
  end
end
