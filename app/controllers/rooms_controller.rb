# frozen_string_literal: true

class RoomsController < ApplicationController
  before_action :set_current_user
  before_action :require_user_logged_in!
  def index
    @room = Room.new
    @rooms = Room.all
  end

  def create
    @room = Room.create(name: params['room']['name'])
  end

  def show
    @single_room = Room.find(params[:id])
    @rooms = Room.all
    @room = Room.new
    @chat = Chat.new
    @chats = @single_room.chats.latest_first
    render 'index'
  end
end
