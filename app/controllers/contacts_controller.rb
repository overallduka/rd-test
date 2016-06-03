class ContactsController < ApplicationController

  before_action :authenticate_user!

  def index
    @contacts = current_user.contacts
  end

  def new
    @custom_fields = current_user
      .custom_fields
      .to_json
      .html_safe
  end

  def create
    contact = Contact.create(contact_params)
    if contact.valid?
      redirect_to contacts_path, notice: "Contato criado"
    else
      redirect_to new_contact_path, alert: contact.errors.full_messages.first
    end
  end

  protected

  def contact_params
    params.require(:contact).permit(:email, :name)
  end

end
