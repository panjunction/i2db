class PagesController < ApplicationController
  # GET /:model
  def index
    @records = Record.find_all_by_model(params[:model])
    @page = Page.find_by_model_and_type(params[:model], 'index')
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pages }
    end
  end

  # GET /:model/:id
  def show
    @record = Record.find_by_model_and_model_id(params[:model],params[:id])
    @page = Page.find_by_model_and_type(params[:model], 'show')
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @page }
    end
  end

  # GET /:model/new
  def new
    @record = Record.new
    @page = Page.find_by_model_and_type(params[:model], 'new')

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @page }
    end
  end

  # GET /:model/:id/edit
  def edit
    @record = Record.find_by_model_and_model_id(params[:model],params[:id])
    @page = Page.find_by_model_and_type(params[:model], 'new')
  end

  # POST /api/pages
  def create
    @page = Page.new(params[:page])

    respond_to do |format|
      if @page.save
        format.html { redirect_to(@page, :notice => 'Page was successfully created.') }
        format.xml  { render :xml => @page, :status => :created, :location => @page }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @page.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /api/pages/:id
  def update
    @page = Page.find(params[:id])

    respond_to do |format|
      if @page.update_attributes(params[:page])
        format.html { redirect_to(@page, :notice => 'Page was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @page.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /api/pages/:id
  def destroy
    @page = Page.find(params[:id])
    @page.destroy

    respond_to do |format|
      format.html { redirect_to(pages_url) }
      format.xml  { head :ok }
    end
  end
  
end
