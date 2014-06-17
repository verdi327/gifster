class FriendshipsController < ApplicationController
  before_action :set_friendship, only: [:show, :edit, :update, :destroy]

  # GET /friendships
  def index
    @friendships = Friendship.all
  end

  # GET /friendships/1
  def show
  end

  # GET /friendships/new
  def new
    @friendship = Friendship.new
  end

  # GET /friendships/1/edit
  def edit
  end

  # POST /friendships
  def create
    @friendship = Friendship.new(friendship_params)

    if @friendship.save
      redirect_to @friendship, notice: 'Friendship was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /friendships/1
  def update
    if @friendship.update(friendship_params)
      redirect_to @friendship, notice: 'Friendship was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /friendships/1
  def destroy
    @friendship.destroy
    redirect_to friendships_url, notice: 'Friendship was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friendship
      @friendship = Friendship.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def friendship_params
      params.require(:friendship).permit(:user_id, :friend_id, :create, :destroy)
    end
end
