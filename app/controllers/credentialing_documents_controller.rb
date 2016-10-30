class CredentialingDocumentsController < ApplicationController
  before_action :set_credentialing_document, only: [:show, :edit, :update, :destroy]

  # GET /credentialing_documents
  # GET /credentialing_documents.json
  def index
    @credentialing_documents = CredentialingDocument.all
  end

  # GET /credentialing_documents/1
  # GET /credentialing_documents/1.json
  def show
    send_data(@document.file_contents,
            type: @document.content_type,
            filename: @document.filename)
  end

  # GET /credentialing_documents/new
  def new
    @credentialing_document = CredentialingDocument.new
  end

  # GET /credentialing_documents/1/edit
  def edit
  end

  # POST /credentialing_documents
  # POST /credentialing_documents.json
  def create
    @credentialing_document = CredentialingDocument.new(credentialing_document_params)

    respond_to do |format|
      if @credentialing_document.save
        format.html { redirect_to @credentialing_document, notice: 'Credentialing document was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /credentialing_documents/1
  # PATCH/PUT /credentialing_documents/1.json
  def update
    respond_to do |format|
      if @credentialing_document.update(credentialing_document_params)
        format.html { redirect_to @credentialing_document, notice: 'Credentialing document was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /credentialing_documents/1
  # DELETE /credentialing_documents/1.json
  def destroy
    @credentialing_document.destroy
    respond_to do |format|
      format.html { redirect_to credentialing_documents_url, notice: 'Credentialing document was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_credentialing_document
      @credentialing_document = CredentialingDocument.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def credentialing_document_params
      params.require(:credentialing_document).permit(:filename, :content_type, :file_contents)
    end
end
