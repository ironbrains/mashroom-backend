require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  describe '#index' do
    it 'has proper info' do
      get :index
      expect(response.status).to eql 200
      expect(JSON.parse(response.body)['project']['name']).to eql 'Mushroom Backend'
    end
  end
end
