class PagesController < ApplicationController
  def home; end

  def dnd
    @q = Spell.ransack(params[:q])
    @spells = @q.result.includes(:dnd_classes)
  end

  def fate
    @chapters = Fate::Chapter.includes(:fate_dials)
    @q = Fate::Trick.ransack(params[:q])
    @tricks = @q.result(distinct: true).includes(:fate_rulebook, :fate_dials)
  end
end
