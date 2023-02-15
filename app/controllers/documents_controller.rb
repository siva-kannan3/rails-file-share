require 'securerandom'

class DocumentsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_document, only: %i[ update destroy ]
  helper_method :human_readable_size


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


  # POST /documents or /documents.json
  def create
    params[:document][:key] = SecureRandom.hex(10)
    @document = current_user.documents.create(document_params)
    @document.save
    flash[:notice] = "File uploaded successfully!"
    redirect_to root_path
  end

  # PATCH/PUT /documents/1 or /documents/1.json
  def update
    @document && @document.update(document_params) 
    flash[:notice] = "Status updated successfully!"
    redirect_to root_path
  end

  # DELETE /documents/1 or /documents/1.json
  def destroy
    @document.attached_document.purge_later
    @document.destroy
    redirect_to root_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document
      @document = current_user.documents.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def document_params
      params.require(:document).permit(:key, :shared, :attached_document)
    end

end
