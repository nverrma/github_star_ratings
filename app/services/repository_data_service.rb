# frozen_string_literal: true

# app/services/repository_data_service.rb
class RepositoryDataService
  
  attr_accessor :username

  BASE_URL = 'https://api.github.com'

  def initialize(username)
    @username = username
  end

  def call
    create_repository(repository_data)
  end
  
  private

  def repository_data
    fetch_repository_data.map do |repo|
      { 
        name: repo['name'],
        stars: repo['stargazers_count'] 
      }
    end
  end

  def fetch_repository_data
    response = HTTParty.get(url)

    JSON.parse(response.body)
  end

  def url
    "#{BASE_URL}/users/#{username}/repos"
  end

  def create_repository(repos_data)
    repos_data.each do |data|
      repo = user.repositories.find_or_create_by(repo_name: data[:name])
      repo.repo_stars = data[:stars]
      repo.save!
    end
  end

  def user
    User.find_or_create_by(username: username)
  end
end
