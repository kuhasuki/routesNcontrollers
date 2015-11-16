class UsersController < ApplicationController
  def index
    render json: User.all
  end

  def create
    user = User.new(dem_paramz)

    if user.save
      render json: user
    else
      render(
        json: user.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def show
    user = User.find(params[:id])

    if user
      render json: user
    else
      render(
        json: user.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def update
    user = User.find(params[:id])

    if user.update(dem_paramz)
      render json: user
    else
      render(
        json: user.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def destroy
    user = User.find(params[:id])

    if user.delete
      render json: user
    else
      render(
        json: user.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  private

  def dem_paramz
    params.require(:user).permit(:name, :email)
  end

end
