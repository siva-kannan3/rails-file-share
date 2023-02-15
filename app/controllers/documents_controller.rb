require 'securerandom'

class DocumentsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :download]
  before_action :set_document, only: %i[ update destroy]
  helper_method :download_file


  # GET /documents or /documents.json
  def index
    @documents = current_user.documents.order!(created_at: :desc)
  end

  # GET /documents/1 or /documents/1.json
  def show
    @document = Document.where(key: params[:id]).first
    @document_owner = @document.try!(:user)
  end

  # GET /documents/new
  def new
    @document = Document.new
  end

  def download
    @document = Document.find_by!(key: params[:key])
    if @document
      @document_owner = @document.try!(:user)
      if (@document_owner == current_user) || (@document_owner != current_user && @document.shared)
        download_file(@document)
      else 
        redirect_to root_path, alert: "File download failed!"
      end
    else
      redirect_to root_path, alert: "File download failed!"
    end
  end


  # POST /documents or /documents.json
  def create
    params[:document][:key] = SecureRandom.hex(10)
    @document = current_user.documents.create(document_params)

    if @document.save
      redirect_to root_path, notice: "File uploaded successfully!"
    else
      redirect_to root_path, alert: "File upload failed!"
    end
  end

  # PATCH/PUT /documents/1 or /documents/1.json
  def update
    if @document.update(document_params) 
      redirect_to root_path, notice: "Status updated successfully!"
    else
      redirect_to root_path, alert: "Status update failed!"
    end
  end

  # DELETE /documents/1 or /documents/1.json
  def destroy
    if @document.destroy
      redirect_to root_path, notice: "Document deleted successfully!"
    else
      redirect_to root_path, alert: "Document delete failed!"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document
      @document = current_user.documents.find(params[:id])
      if !@document
        redirect_to root_path, alert: "Could not find the document!"
      end
    end

    # Only allow a list of trusted parameters through.
    def document_params
      params.require(:document).permit(:key, :shared, :attached_document)
    end

    def download_file(document)
      send_data document.attached_document.download, filename: document.attached_document.filename.to_s, content_type: document.attached_document.content_type
    end
end