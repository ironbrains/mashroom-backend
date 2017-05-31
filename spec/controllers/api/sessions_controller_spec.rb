require 'rails_helper'

RSpec.describe Api::SessionsController, type: :controller do
  describe '#create' do
    let(:email) { 'correct.email@example.com' }
    let(:password) { 'correct.password' }

    let!(:user) { FactoryGirl.create :user, email: email, password: password, password_confirmation: password }

    context 'with correct credentials' do
      it 'has OK status' do
        post :create, params: { session: { email: email, password: password } }
        expect(response.status).to eql 200
      end
    end

    context 'with incorrect credentials' do
      it 'has UNAUTHORIZED status' do
        post :create, params: { session: { email: email, password: 'incorrect.password' } }
        expect(response.status).to eql 401
      end
    end
  end
end
