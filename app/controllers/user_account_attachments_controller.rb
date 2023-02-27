# frozen_string_literal: true

class UserAccountAttachmentsController < ApplicationController
  before_action :set_user_account_attachment, only: %i[show edit update destroy]

  # GET /user_account_attachments or /user_account_attachments.json
  def index
    @user_account_attachments = UserAccountAttachment.all
  end

  # GET /user_account_attachments/1 or /user_account_attachments/1.json
  def show; end

  # GET /user_account_attachments/new
  def new
    @user_account_attachment = UserAccountAttachment.new
  end

  # GET /user_account_attachments/1/edit
  def edit; end

  # POST /user_account_attachments or /user_account_attachments.json
  def create
    @user_account_attachment = UserAccountAttachment.new(user_account_attachment_params)

    respond_to do |format|
      if @user_account_attachment.save
        format.html do
          redirect_to user_account_attachment_url(@user_account_attachment),
                      notice: 'User account attachment was successfully created.'
        end
        format.json { render :show, status: :created, location: @user_account_attachment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_account_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_account_attachments/1 or /user_account_attachments/1.json
  def update
    respond_to do |format|
      if @user_account_attachment.update(user_account_attachment_params)
        format.html do
          redirect_to user_account_attachment_url(@user_account_attachment),
                      notice: 'User account attachment was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @user_account_attachment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_account_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_account_attachments/1 or /user_account_attachments/1.json
  def destroy
    @user_account_attachment.destroy

    respond_to do |format|
      format.html do
        redirect_to user_account_attachments_url, notice: 'User account attachment was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user_account_attachment
    @user_account_attachment = UserAccountAttachment.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_account_attachment_params
    params.require(:user_account_attachment).permit(:user_account_id, :certificate)
  end
end
