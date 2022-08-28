class PagesController < ApplicationController
  skip_before_action :set_contributors

  def home; end
end
