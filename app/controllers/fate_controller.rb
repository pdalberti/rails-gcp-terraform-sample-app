class FateController < ApplicationController
  def triky
    @q = Fate::Trick.ransack(params[:q])
    @tricks = @q.result
  end
end
