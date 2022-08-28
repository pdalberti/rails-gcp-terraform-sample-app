class ApplicationController < ActionController::Base
  before_action :set_contributors

  CONTRIBUTORS = {
    'kouzla' => %w[Sirien Arled],
    'predmety' => %w[Archimedesfort1 Arled],
    'triky' => %w[Sirien]
  }.freeze

  def default_url_options
    { host: ENV['DOMAIN'] || 'localhost:3000' }
  end

  private

  def set_contributors
    @contributors = CONTRIBUTORS[action_name]
  end
end
