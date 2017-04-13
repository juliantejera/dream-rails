class UsersController < ApplicationController
  before_action :authenticate_user!

  # GET /users
  def index
    @users = current_user.nearbys(radius).limit(limit).offset(offset)
    render json: @users, each_serializer: UserSerializer
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

end
