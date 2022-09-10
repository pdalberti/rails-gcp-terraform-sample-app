class ApplicationController < ActionController::Base
  before_action :set_theme
  before_action :set_contributors

  CONTRIBUTORS = {
    'kouzla' => %w[Sirien Arled],
    'predmety' => %w[Archimedesfort1 Arled],
    'triky' => %w[Sirien],
    'schopnosti' => %w[fafrin]
  }.freeze

  def default_url_options
    { host: ENV['DOMAIN'] || 'localhost:3000' }
  end

  private

  def set_contributors
    @contributors = CONTRIBUTORS[action_name]
  end

  def set_theme
    @url = request.url
    return cookies[:theme] = :light if cookies[:theme].nil?
    return unless params[:theme].present?

    cookies[:theme] = params[:theme].to_sym
    redirect_to(@url.split('?').first)
  end
end
