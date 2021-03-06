class RecordsController < ApplicationController
  # GET /records
  # GET /records.xml
  def index
    @records = Record.find_by_model(params[:model])

    respond_to do |format|
      format.html # index.html.erb
      format.json do
        # Returns json of records
      end
    end
  end

  # GET /api/records/:id
  def show
    @record = Record.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json do
        # Returns json of record
      end
    end
  end

  # GET /api/records/new
  def new
    @record = Record.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /api/records/:id/edit
  def edit
    @record = Record.find(params[:id])
  end

  # POST /api/records
  def create
    @record = Record.new(params[:record])

    respond_to do |format|
      if @record.save
        format.html { redirect_to(@page, :notice => 'Page was successfully created.') }
        format.xml  { render :xml => @page, :status => :created, :location => @page }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @page.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /api/records/:id
  def update
    @record = Record.find_by_model_and_model_id(params[:model],params[:id])

    respond_to do |format|
      if @record.update_attributes(params[:record])
        format.html { redirect_to(@page, :notice => 'Page was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @page.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /api/records/:id
  def destroy
    @record = Record.find_by_model_and_model_id(params[:model],params[:id])
    @record.destroy

    respond_to do |format|
      format.html { redirect_to(pages_url) }
      format.xml  { head :ok }
    end
  end
end
