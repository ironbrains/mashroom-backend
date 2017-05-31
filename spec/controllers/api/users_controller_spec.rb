require 'rails_helper'

RSpec.describe Api::UsersController, type: :controller do
  describe '#create' do
    context 'when params is valid' do
      let(:params) do
        {
          email: 'john.smith@example.com',
          first_name: 'John',
          last_name: 'Smith',
          password: 'password',
          password_confirmation: 'password'
        }
      end

      it { expect { post(:create, params: { user: params }) }.to change User, :count }
    end
  end
end
