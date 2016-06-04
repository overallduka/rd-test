require 'rails_helper'

RSpec.describe ContactsController, type: :controller do
  let(:user) { create(:user) }

  describe "POST #create" do

    context "when contact has valid" do
      before { sign_in user }
      it "should create new contact" do
        contact  = { email: FFaker::Internet.email }
        post :create, contact: contact
        expect(Contact.count).to eq 1
        expect(response).to have_http_status(200)
      end
    end

    context "when contact has no email" do
      before { sign_in user }
      it "should not create contact" do
        contact  = { email: nil }
        post :create, contact: contact
        expect(Contact.count).to eq 0
        expect(response).to have_http_status(422)
      end
    end

    context "when contact has custom_field_values" do
      before { sign_in user }
      it "should create custom_field_values models" do
        contact             = { email: FFaker::Internet.email }
        custom_field_values = { Cor: "Preto", "Tamanho do pé": 35 }
        post :create, { 
          contact: contact, 
          custom_field_values: custom_field_values 
        }
        contact_created = Contact.first
        expect(contact_created.custom_field_values.count).to eq 2
        expect(response).to have_http_status(200)
      end
    end

    context "when has no user authenticated" do
      before { sign_in nil }
      it "should redirect to sign_in path" do
        contact  = { email: FFaker::Internet.email }
        post :create, contact: contact
        expect(response).to have_http_status(302)
      end
    end


  end

  describe "GET #index" do
    context "when has no user authenticated" do
      before { sign_in nil }
      it "should redirect to sign_in path" do
        get :index
        expect(response).to have_http_status(302)
      end
    end
  end

  describe "GET #new" do
    context "when has no user authenticated" do
      before { sign_in nil }
      it "should redirect to sign_in path" do
        get :new
        expect(response).to have_http_status(302)
      end
    end
  end

end
