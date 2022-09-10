class Drd2Controller < ApplicationController
  def schopnosti
    @q = Drd2::Ability.ransack(params[:q])
    @elements = @q.result
  end
end
