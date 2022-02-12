class PagesController < ApplicationController
  def home
    @q = Spell.ransack(params[:q])
    @spells = @q.result
  end
end
