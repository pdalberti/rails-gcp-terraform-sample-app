class PagesController < ApplicationController
  def home; end

  def dnd
    @q = Spell.ransack(params[:q])
    @spells = @q.result.includes(:dnd_classes, :rulebooks)
  end
end
