module Api
  class UsersController < ApplicationController
    def show
      @user = User.find(params[:id])
    end

    def create
      @user = User.new(user_params)

      if @user.save
        render :show, status: :created
      else
        render :show, status: :unprocessable_entity
      end
    end

    def follow
      follower = User.find(params[:user_id])
      followed = User.find(params[:id])

      following = followed.follow(follower)

      if following.valid?
        head :created
      else
        render json: { error: 'already following' }, status: :unprocessable_entity
      end
    end

    def unfollow
      follower = User.find(params[:user_id])
      followed = User.find(params[:id])

      if followed.unfollow(follower)
        head :no_content
      else
        render json: { error: "not following user #{params[:id]}" }, status: :unprocessable_entity
      end
    end

    def followers
      @user = User.find(params[:id])
      @users = @user.followers.order(:username)
    end

    private

    def user_params
      params.require(:user).permit(:name, :username)
    end
  end
end
