class ApplicationsController < ApplicationController
  before_action :authenticate

  def index
    @applications = Application.all
  end

  # GET /applications/1/edit
  def edit
    @application = Application.find(params[:id])
    render :edit
  end

  # PUT /applications/1
  # PUT /applications/1.json
  def update
    @application = Application.find(params[:id])

    respond_to do |format|
      if @application.update_attributes(application_params)
        format.html { redirect_to applications_url, :success => 'Application was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @application.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    Application.find_by_id(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to applications_url }
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

  def application_params
    params.require(:application).permit(:timeslot_id,:postje_id,:hour)
  end

end