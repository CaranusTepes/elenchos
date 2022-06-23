class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  add_flash_types :info, :error, :success

  rescue_from ActiveRecord::RecordNotFound do |exception|
    redirect_to root_url, :flash => { :error => "Record not found." }
  end
end
