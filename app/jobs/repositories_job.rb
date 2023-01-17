# frozen_string_literal: true

# app/jobs/repositories.rb
class RepositoriesJob < ApplicationJob

  def perform(params)
    RepositoryDataService.new(params).()
  end

end
