class PagesController < ApplicationController
  skip_before_action :set_contributors

  def home
    @cards = {
      kouzla_dnd_index: { img: 'dnd.png', icon: 'scroll', text: ' DnD kartotéka kouzel' },
      predmety_dnd_index: { img: 'dnd.png', icon: 'toolbox', text: ' DnD kartotéka předmětů' },
      # schopnosti_drd2_index: { img: 'drd2.png', text: 'DrD2 kartotéka schopností' },
      triky_fate_index: { img: 'fate.png', text: 'Fate kartotéka triků' }
    }
  end
end
