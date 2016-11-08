class CredentialingDocumentsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  # GET /credentialing_documents
  def index
    @credentialing_documents = CredentialingDocument.all
  end

  # GET /credentialing_documents/1
  def show
    @credentialing_document = CredentialingDocument.find(params[:id])
  end

  # GET /credentialing_documents/new
  def new
    @credentialing_document = current_user.credentialing_documents.new
  end

  # GET /credentialing_documents/1/edit
  def edit
    @credentialing_document = current_user.credentialing_documents.find(params[:id])
  end

  # POST /credentialing_documents
  def create
    @credentialing_document = current_user.credentialing_documents.new(item_params)

    if @credentialing_document.save
        redirect_to @credentialing_document, notice: 'Credentialing document was successfully created.' 
    else
      render :new 
    end
  end

  # PATCH/PUT /credentialing_documents/1
  def update
    @credentialing_document = current_user.credentialing_documents.find(params[:id])
    if @credentialing_document.update(credentialing_document_params)
      redirect_to @credentialing_document, notice: 'Credentialing document was successfully updated.' 
    else
      render :edit 
    end
  end

  # DELETE /credentialing_documents/1
  def destroy
    @credentialing_document = current_user.credentialing_documents.find(prarams[:id])
    @credentialing_document.destroy
    redirect_to credentialing_documents_url, notice: 'Credentialing document was successfully destroyed.' 
    end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def credentialing_document_params
      params.require(:credentialing_document).permit(:filename, :content_type, :file_contents)
    end
end
