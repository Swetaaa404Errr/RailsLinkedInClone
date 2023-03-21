# frozen_string_literal: true

class UserAccountsController < ApplicationController
  before_action :set_current_user
  before_action :require_user_logged_in!

  def dashboard; end

  def index
    @user_account = UserAccount.all
  end

  def new
    @user_account = UserAccount.new
    @user_account_attachment = @user_account.user_account_attachments.new
  end 

  def create
    @user_account = @current_user.user_accounts.new(user_account_params)
    respond_to do |format|
      if @user_account.save
        format.html { redirect_to user_accounts_path, notice: 'Your Informmation saved successfully .' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def edit
    @user_account = UserAccount.find(params[:id])
  end

  def update
    @user_account = UserAccount.find(params[:id])
    if @user_account.update(user_account_params)

      redirect_to user_accounts_path, notice: 'Successfully updated Your Profile'
    else

      render :edit
    end
  end

  private

  def user_account_params
    params.require(:user_account).permit(:gmail, :username, :link, :expericencee, :orgganisation, :skiill,
                                         :picture, :cv, :qualificatioon, :notification, :cvdownload, :bio, certificate:[], job: [])
  end
end
