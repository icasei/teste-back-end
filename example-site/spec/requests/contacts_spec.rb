require 'rails_helper'

RSpec.describe 'fluxo da página de contatos', :type => :request do
  describe "GET #index" do
    it "returns http success" do
      get '/home'
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #sobre" do
    it "returns http success" do
      get '/sobre'
      expect(response).to have_http_status(:success)
    end
  end

 describe "GET #new" do
    it "returns http success" do
      get '/contacts/new'
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    let(:request) { post '/contacts', :params => { :contact => contact_params } }
    context 'parâmetros corretos' do
      let(:contact_params) { FactoryBot.attributes_for(:contact) }
      it 'cria um novo contato' do
        expect { request }.to change(Contact, :count).by(1)
      end
      context 'Página' do
        before { request }
        it 'redireciona para `new`' do
          expect(response).to redirect_to('/contacts/new')
        end
        it 'exibe informação de sucesso' do
          expect(flash[:success]).to be_present
        end
      end
    end
    context 'parâmetros incorretos' do
      let(:contact_params) { { email: "", name: "Joao da Silva", guid: "" } }
      it 'exibe informação de erro' do
        request
        expect(flash[:error]).to be_present
      end
    end
  end
end
