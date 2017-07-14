class UsersController < ApplicationController
  before_action :authenticate_user!

  # GET /users
  def index
    @users = current_user.nearbys(radius)
                         .limit(limit)
                         .offset(offset)
                         .includes(:photos)
    render json: @users, each_serializer: UserSerializer
  end

  # PATCH/PUT /users/1
  def update
    if current_user.update(user_params)
      render json: {}
    else
      render json: current_user.errors, status: :unprocessable_entity
    end
  end

  private

    # In miles
    def radius
      params[:radius] || 1000
    end

    def limit
      params[:limit] || 20
    end

    def offset
      params[:offset] || 0
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:latitude, :longitude)
    end
end
