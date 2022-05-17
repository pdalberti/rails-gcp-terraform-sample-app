class DndController < ApplicationController
  def kouzla
    @q = Spell.ransack(spell_params)
    @spells = @q.result
  end

  private

  def spell_params
    params[:q]&.reject { |_k, v| v == '0' }
  end
end
