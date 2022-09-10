class FateController < ApplicationController
  def triky
    @q = Fate::Trick.ransack(params[:q])
    @elements = @q.result
  end
end
