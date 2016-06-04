require 'rails_helper'

RSpec.describe CustomFieldsController, type: :controller do
  let(:user) { create(:user) }

  describe "GET #index" do
    context "when user is not authenticated" do
      before { sign_in nil }
      it "redirect to sign_in path" do
        get :index
        expect(response).to have_http_status(302)
      end
    end
  end

  describe "GET #new" do
    context "when user is not authenticated" do
      before { sign_in nil }
      it "redirect to sign_in path" do
        get :new
        expect(response).to have_http_status(302)
      end
    end
  end

  describe "POST #create" do
    context "when user is not authenticated" do
      before { sign_in nil }
      it "redirect to sign_in path" do
        post :create
        expect(response).to have_http_status(302)
      end
    end

    context "when custom_field is text type" do
      before { sign_in user }
      it "should create just custom_field" do
        custom_field   = { label: "Some label", custom_field_type: :text }
        custom_options = ['Option 1']
        post :create, { custom_field: custom_field, custom_options: custom_options }
        expect(CustomField.count).to  eq 1
        expect(CustomOption.count).to eq 0
      end
    end

    context "when custom_field is textarea type" do
      before { sign_in user }
      it "should create just custom_field" do
        custom_field   = { label: "Some label", custom_field_type: :text_area }
        custom_options = ['Option 1']
        post :create, { custom_field: custom_field, custom_options: custom_options }
        expect(CustomField.count).to  eq 1
        expect(CustomOption.count).to eq 0
      end
    end

    
    context "when custom_field is combo_box type" do
      before { sign_in user }
      it "should create custom_field and custom_options" do
        custom_field   = { label: "Some label", custom_field_type: :combo_box }
        custom_options = ['Option 1']
        post :create, { custom_field: custom_field, custom_options: custom_options }
        expect(CustomField.count).to  eq 1
        expect(CustomOption.count).to eq 1
      end
    end

  end

end
