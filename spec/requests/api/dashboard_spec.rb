require 'swagger_helper'

RSpec.describe 'api/dashboard', type: :request do

  path '/api/dashboard/stats' do

    get('stats dashboard') do
      tags 'Dashboard'
      response(200, 'successful') do

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
