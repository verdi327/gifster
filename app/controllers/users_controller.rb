class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  def index
    @users = User.all

    respond_to do |format|
      format.html {
        @users_json = @users.map {|user| UserSerializer.new(user).serializable_hash}
        @urls = {
          users: users_path
        }
      }
      format.json { render json: @users, root: false, each_serializer: UserSerializer }
    end
  end

  # POST /users
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, root: false }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /users/1
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render json: @user, root: false}
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /users/1
  def destroy
    respond_to do |format|
      @user.destroy
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { render json: true}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email)
    end
end
