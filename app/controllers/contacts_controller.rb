class ContactsController < ApplicationController

  def index
    @contacts = Contact.all
  end

  def new
    @contact = Contact.new
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
