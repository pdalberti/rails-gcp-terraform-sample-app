class PagesController < ApplicationController
  def home; end

  def dnd
    @q = Spell.ransack(params[:q])
    @spells = @q.result
  end

  def fate
    @q = Fate::Trick.ransack(params[:q])
    @tricks = @q.result
  end
end
