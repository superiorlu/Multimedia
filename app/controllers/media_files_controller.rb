class MediaFilesController < ApplicationController
  # GET /media_files
  # GET /media_files.json
  def index
    @media_files = MediaFile.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @media_files }
    end
  end

  def upload
   @media_file = MediaFile.new(params[:media_file])
   @media_file.upload
   @media_file.parse
   render :text => "upload successfully!"
  end

  # GET /media_files/1
  # GET /media_files/1.json
  def show
    @media_file = MediaFile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @media_file }
    end
  end

  # GET /media_files/new
  # GET /media_files/new.json
  def new
    @media_file = MediaFile.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @media_file }
    end
  end

  # GET /media_files/1/edit
  def edit
    @media_file = MediaFile.find(params[:id])
  end

  # POST /media_files
  # POST /media_files.json
  def create
    @media_file = MediaFile.new(params[:media_file])

    respond_to do |format|
      if @media_file.save
        format.html { redirect_to @media_file, notice: 'Media file was successfully created.' }
        format.json { render json: @media_file, status: :created, location: @media_file }
      else
        format.html { render action: "new" }
        format.json { render json: @media_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /media_files/1
  # PUT /media_files/1.json
  def update
    @media_file = MediaFile.find(params[:id])

    respond_to do |format|
      if @media_file.update_attributes(params[:media_file])
        format.html { redirect_to @media_file, notice: 'Media file was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @media_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /media_files/1
  # DELETE /media_files/1.json
  def destroy
    @media_file = MediaFile.find(params[:id])
    @media_file.destroy

    respond_to do |format|
      format.html { redirect_to media_files_url }
      format.json { head :no_content }
    end
  end
end
