class Drd2Controller < ApplicationController
  def schopnosti
    @q = Drd2::Ability.ransack(params[:q])
    @abilities = @q.result
  end
end
