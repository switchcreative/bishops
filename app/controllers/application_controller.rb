class ApplicationController < ActionController::Base
  protect_from_forgery
  has_mobile_fu false

  before_filter :initialize_data

  def render_404
    render "errors/404", status: :not_found
  end

private

  def initialize_data
    @contact = Contact.new
    @menu = Menu.new
  end
end
