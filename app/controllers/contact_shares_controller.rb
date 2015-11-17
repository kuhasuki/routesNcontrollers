class ContactSharesController < ApplicationController

  def index
    render json: ContactShare.all
  end

  def create
    contactshare = ContactShare.new(dem_paramz)

    if contactshare.save
      render json: contactshare
    else
      render(
        json: contactshare.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def destroy
    contactshare = ContactShare.find(params[:id])

    if contactshare.delete
      render json: contactshare
    else
      render(
        json: contactshare.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  private

  def dem_paramz
    params.require(:contact_share).permit(:user_id, :contact_id)
  end

end
