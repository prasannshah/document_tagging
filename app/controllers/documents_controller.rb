class DocumentsController < ApplicationController
  before_action :set_document, only: [:show, :edit, :update, :destroy]

  # GET /documents
  # GET /documents.json
  def index
    @documents = Document.includes(:document_tags).where( :document_tags => { :document_id => nil } ).order("RANDOM()").limit(100)
  end

  # GET /documents/1
  # GET /documents/1.json
  def show
    page_count = 1
    @document_content_type = case @document.file_content_type
      when 'application/pdf'
        reader = PDF::Reader.new(open(@document.file.path))
        page_count = reader.page_count
        'PDF'
      when /image*/
        'IMAGE'
      else
        'TEXT'
    end
    @all_tags = Tag.all.order(:name).map {|t| t.name }
    page_count.times { |i| @document.document_tags.build(page_number: i+1) }
  end

  # GET /documents/new
  def new
    @document = Document.new
  end

  # GET /documents/1/edit
  def edit
  end

  # POST /documents
  # POST /documents.json
  def create
    @document = Document.new(document_params)

    respond_to do |format|
      if @document.save
        format.html { redirect_to @document, notice: 'Document was successfully created.' }
        format.json { render :show, status: :created, location: @document }
      else
        format.html { render :new }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /documents/1
  # PATCH/PUT /documents/1.json
  def update
    respond_to do |format|
      if @document.update(document_params)
        new_document = Document.includes(:document_tags).where( :document_tags => { :document_id => nil } ).order("RANDOM()").limit(1).first
        format.html { redirect_to document_url(new_document), notice: 'Document was successfully updated.' }
        format.json { render :show, status: :ok, location: @document }
      else
        @all_tags = Tag.all.order(:name).map {|t| t.name }
        format.html { render :show }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /documents/1
  # DELETE /documents/1.json
  def destroy
    @document.destroy
    respond_to do |format|
      format.html { redirect_to documents_url, notice: 'Document was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document
      @document = Document.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def document_params
      params.fetch(:document, {}).permit(:shipment_id, :original_tags, :file, document_tags_attributes: [:id, :page_number, :tag, :_destroy])
    end
end
