class PagesController < ApplicationController
  def home
    # return @spells = [] if params[:q].blank?

    @spells = Spell.first(10)
  end
end
