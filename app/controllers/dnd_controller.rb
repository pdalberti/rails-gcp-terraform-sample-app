class DndController < ApplicationController
  def kouzla
    @q = Spell.ransack(present_params)
    @spells = @q.result
  end

  def predmety
    @q = Dnd::Item.ransack(present_params)
    @items = @q.result
  end

  private

  def present_params
    params[:q]&.reject { |_k, v| v == '0' }
  end
end
