require 'rails_helper'

file_path = File.join(File.dirname(__FILE__), 'repositories_stub.json')
stub_result = File.open(file_path).read

RSpec.describe RepositoriesController, type: :request do
  describe 'POST /repositories' do
    subject do
      post('/repositories', params: { username: 'rails' })
    end

    let(:response_json) do
      [
        {
          "name": "account_location",
          "stargazers_count": 71
        },
        {
          "name": "actioncable",
          "stargazers_count": 1091
        }
      ]
    end

    before do
      stub_request(:get, "https://api.github.com/users/rails/repos").
        with(
          headers: {
            'Accept': '*/*',
            'Accept-Encoding': 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
            'User-Agent': 'Ruby'
          }
        ).
        to_return(status: 200, body: stub_result, headers: {})
      subject
    end

    it "shoud save and render correct results" do
      json = JSON.parse(response.body)
      expect(response).to have_http_status(:ok)
      expect(json.first["name"]).to eq("account_location")
    end
  end
end
