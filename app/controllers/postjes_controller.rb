class PostjesController < ApplicationController
  before_filter :authenticate

  # GET /postjes
  # GET /postjes.json
  def index
    @postjes = Postje.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @postjes }
    end
  end

  # GET /postjes/1
  # GET /postjes/1.json
  def show
    @postje = Postje.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @postje }
    end
  end

  # GET /postjes/new
  # GET /postjes/new.json
  def new
    @postje = Postje.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @postje }
    end
  end

  # GET /postjes/1/edit
  def edit
    @postje = Postje.find(params[:id])
  end

  # POST /postjes
  # POST /postjes.json
  def create
    @postje = Postje.new(params[:postje])

    respond_to do |format|
      if @postje.save
        format.html { redirect_to @postje, :notice => 'Postje was successfully created.' }
        format.json { render :json => @postje, :status => :created, :location => @postje }
      else
        format.html { render :action => "new" }
        format.json { render :json => @postje.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /postjes/1
  # PUT /postjes/1.json
  def update
    @postje = Postje.find(params[:id])

    respond_to do |format|
      if @postje.update_attributes(params[:postje])
        format.html { redirect_to @postje, :notice => 'Postje was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @postje.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /postjes/1
  # DELETE /postjes/1.json
  def destroy
    @postje = Postje.find(params[:id])
    @postje.destroy

    respond_to do |format|
      format.html { redirect_to postjes_url }
      format.json { head :ok }
    end
  end
end
