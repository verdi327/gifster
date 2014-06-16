class FriendsController < ApplicationController
  before_action :set_user

  def index
    @friends = @user.friends

    respond_to do |format|
      format.html {
        @friends_json = @friends.to_json
        @user_id = @user.id
      }
      format.json { render json: @friends, root: false}
    end
  end

  def create
    new_friend = User.find_by_email(params[:email])

    respond_to do |format|
      if @user && new_friend
        @user.friends << new_friend
        format.html { redirect_to user_friends_path(@user), notice: 'Friend Successfully Added' }
        format.json { render json: new_friend.to_json, root: false }
      else
        format.html { render action: 'new' }
        format.json { render json: {error: "No user exists with that email"}, status: 404}
      end
    end
  end

  def destroy
    respond_to do |format|
      Friendship.where(user_id: @user.id, friend_id: params[:id]).first.destroy
      format.html { redirect_to user_friends(@user), notice: 'Friendship Ended' }
      format.json { render json: true}
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end
