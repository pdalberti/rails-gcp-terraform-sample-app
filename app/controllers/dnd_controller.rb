class DndController < ApplicationController
  def kouzla
    @q = Spell.ransack(params[:q])
    @spells = @q.result
  end
end
