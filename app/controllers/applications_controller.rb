class ApplicationsController < ApplicationController
  before_action :authenticate

  def index
    @applications = Application.all
  end

  def destroy
    Application.find_by_id(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to postjes_url }
      format.json { head :no_content }
    end
  end

  def opkuis
    Application.destroy_all
    respond_to do |format|
      format.html { redirect_to postjes_url }
      format.json { head :no_content }
    end
  end
end
