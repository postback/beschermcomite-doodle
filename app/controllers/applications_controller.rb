class ApplicationsController < ApplicationController
  before_action :authenticate

  def index
    @applications = Application.all
  end

  def destroy
    Application.find_by_id(params[:id]).destroy
    redirect_to applications_path
  end

  def opkuis
    Application.destroy_all
    redirect_to applications_path
  end
end
