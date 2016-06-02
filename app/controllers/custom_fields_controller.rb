class CustomFieldsController < ApplicationController

  def index
    @custom_fields = CustomField.all.includes(:custom_options)
  end

  def new

  end

end
