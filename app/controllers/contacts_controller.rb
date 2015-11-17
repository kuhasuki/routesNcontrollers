class ContactsController < ApplicationController
  def index
    users_contacts = User.find(params[:user_id]).contacts
    shared_contacts = User.find(params[:user_id]).shared_contacts
    render json: users_contacts + shared_contacts
  end

  def create
    contact = Contact.new(dem_paramz)

    if contact.save
      render json: contact
    else
      render(
        json: contact.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def show
    contact = Contact.find(params[:id])

    if contact
      render json: contact
    else
      render(
        json: contact.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def update
    contact = Contact.find(params[:id])

    if contact.update(dem_paramz)
      render json: contact
    else
      render(
        json: contact.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def destroy
    contact = Contact.find(params[:id])

    if contact.delete
      render json: contact
    else
      render(
        json: contact.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  private

  def dem_paramz
    params.require(:contact).permit(:name, :email, :user_id)
  end
end
