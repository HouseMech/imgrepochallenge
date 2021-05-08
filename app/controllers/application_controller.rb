class ApplicationController < ActionController::Base
  before_action :define_q

  private
  def define_q
    @q = Image.ransack(params[:q])
  end
end
