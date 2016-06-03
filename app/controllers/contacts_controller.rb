class ContactsController < ApplicationController

  before_action :authenticate_user!

  def index
    @contacts = current_user
      .contacts
      .includes(:custom_field_values)
  end

  def new
    @custom_fields = current_user
      .custom_fields
      .to_json(include: :custom_options)
      .html_safe
  end

  def create
    contact = current_user
      .contacts
      .create(contact_params)
    if contact.valid?
      if params[:custom_field_values].present?
        create_custom_field_values(contact)
      end
      render json: { message: :success }
    else
      render json: { error: contact.errors.full_messages.first }, status: 422
    end
  end

  protected

  def create_custom_field_values(contact)
    params[:custom_field_values].each do |label, value|
      contact.custom_field_values.create(
        label: label, 
        value: value
      )
    end
  end

  def contact_params
    params.require(:contact).permit(:email, :name)
  end

end
