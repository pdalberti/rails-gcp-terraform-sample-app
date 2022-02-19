class PagesController < ApplicationController
  def home
    @q = Spell.ransack(params[:q])
    @spells = @q.result.includes(:dnd_classes, :rulebooks)
  end
end
