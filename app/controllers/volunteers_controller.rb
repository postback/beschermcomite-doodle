class VolunteersController < ApplicationController
  before_action :authenticate

  def index
    @volunteer = Volunteer.all
  end

  # GET /volunteers/1/edit
  def edit
    @volunteer = Volunteer.find(params[:id])
    render :edit
  end

  # PUT /volunteers/1
  # PUT /volunteers/1.json
  def update
    @volunteer = Volunteer.find(params[:id])

    respond_to do |format|
      if @volunteer.update_attributes(volunteer_params)
        format.html { redirect_to applications_url, :success => 'Volunteer was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @volunteer.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    Volunteer.find_by_id(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to applications_url }
      format.json { head :no_content }
    end
  end

  def volunteer_params
    params.require(:volunteer).permit(:email,:name,:pupil,:grade)
  end

end