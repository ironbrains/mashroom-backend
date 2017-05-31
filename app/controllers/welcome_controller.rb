class WelcomeController < ApplicationController
  def index
    render json: {
      project: {
        name: 'Mushroom Backend',
        version: '0.0.1',
        repository: 'https://github.com/ironbrains/mushroom-backend'
      },
      author: {
        company: 'IronBrains Ltd.'
      }
    }
  end
end
