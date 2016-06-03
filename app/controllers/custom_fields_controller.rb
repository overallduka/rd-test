class CustomFieldsController < ApplicationController

  before_action :authenticate_user!

  def index
    @custom_fields = current_user.custom_fields.includes(:custom_options)
  end

  def new

  end

  def create
    custom_field = current_user.custom_fields.create(custom_field_params)
    if custom_field.valid?
      create_custom_options(custom_field) if custom_field.combo_box?
      render json: { message: :success }
    else
      render json: { error: custom_field.errors.full_messages.first }, status: 422
    end
  end

  protected

  def create_custom_options(custom_field)
    params[:custom_options].each do |option|
      custom_field.custom_options.create(option: option)
    end
  end

  def custom_field_params
    params.require(:custom_field).permit(:label, 
                                         :custom_field_type)
  end

end
