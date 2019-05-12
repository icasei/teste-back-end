require 'rails_helper'

RSpec.describe ContactsController do
  render_views

  describe 'GET new' do
    it 'assigns @contact' do
      contact = Contact.new

      get :new

      expect(assigns[:contact].class).to eq(contact.class)
    end
  end

  describe '#create' do
    context 'with valid params' do
      it 'should create a contact' do
        before_count = Contact.count

        params = {
          contact: {
            name: 'i',
            email: 'casei@i.com',
            guid: '0d7c2c5b-55d2-482e-a00c-516bfe2e8f75'
          }
        }

        post :create, params: params

        expect(Contact.count).to eq(before_count + 1)
        expect(response).to redirect_to(contact_url(assigns(:contact)))
      end
    end

    context 'with invalid params' do
      it 'does not create a contact' do
        before_count = Contact.count
        params = { contact: { name: 'Bla'}}

        post :create, params: params

        expect(Contact.count).to eq(before_count)
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'GET show' do
    context 'with an existing contact' do
      it 'assigns @contact' do
        contact = Contact.create(
          name: 'Josef',
          email: 'blater@josef.com',
          guid: '0d7c2c5b-55d2-482e-a00c-516bfe2e8f75'
        )

        get :show, params: { id: contact._id }

        expect(assigns[:contact]).to eq contact
        expect(response).to render_template(:show)
        expect(response).to have_http_status(:success)
      end

      it 'responds_to json' do
        contact = Contact.create(name: 'Jason', email: 'kruger@jason.io')

        expected_response = {name: 'Jason', email: 'kruger@jason.io'}

        get :show, params: { id: contact._id, format: :json }

        expect(response.content_type).to eq('application/json')
        expect(response).to have_http_status(:success)
        expect(response.parsed_body).to include_json(expected_response)
      end
    end

    context 'with inexistent contact' do
      it 'returns not_found' do
        get :show, params: { id: 1234 }

        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
