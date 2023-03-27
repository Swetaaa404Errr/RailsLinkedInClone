# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_current_user

  before_action :require_admin, only: %i[destroy]

  def notify; end

  def connection; end

  def list
    @userl = User.where.not(admin: true)
  end

  def index
    @user = User.where.not(id: @current_user.id)
  end

  def follow
    @user = User.find(params[:id])
    @current_user.send_follow_request_to(@user)
    redirect_to request.referer
  end

  def unfollow
    @user = User.find(params[:id])
    make_it_a_unfriend_request

    @current_user.unfollow(@user)
    redirect_to request.referer
  end

  def accept
    @user = User.find(params[:id])
    @current_user.accept_follow_request_of(@user)
    make_it_a_friend_request

    @notification = Notification.create(user: @user, notifiable: @current_user, action: 'accepted_follow_request')
    @notification.expiration_time = Time.now + 12.days
    redirect_to request.referer
  end

  def decline
    @user = User.find(params[:id])
    @current_user.decline_follow_request_of(@user)
    redirect_to request.referer
  end

  def cancel
    @user = User.find(params[:id])
    @current_user.remove_follow_request_for(@user)
    redirect_to request.referer
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to users_path, notice: 'Successfully deleted a user'
    else
      redirect_to users_path, notice: 'Couldnt a user'
    end
  end

  def show
    @user = User.find(params[:id])

    @rooms = Room.public_rooms
    @users = User.all_except(@current_user)
    @room = Room.new
    @chat = Chat.new
    @room_name = get_name(@user, @current_user)
    @single_room = Room.where(name: @room_name).first || Room.create_private_room([@user, @current_user], @room_name)
    @chats = @single_room.chats

    render 'rooms/index'
  end

  def search
    @user = User.find(params[:id])
  end

  def profile
    @user = User.find(params[:id])
  end

  def recommended
    @user = User.where.not(id: @current_user.id)
  end

  def follower
    @user = User.find(params[:id])
  end

  private

  def make_it_a_friend_request
    @current_user.send_follow_request_to(@user)
    @user.accept_follow_request_of(@current_user)
  end

  def make_it_a_unfriend_request
    @user.unfollow(@current_user) if @user.mutual_following_with?(@current_user)
  end

  def get_name(user1, user2)
    users = [user1, user2].sort
    "private_#{users[0].id}_#{users[1].id}"
  end
end
