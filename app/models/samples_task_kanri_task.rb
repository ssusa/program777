#coding: utf-8
class SamplesTaskKanriTask < ApplicationRecord

  scope :by_kanryo, ->(kanryo){
    if kanryo.present?
      kanryo_bool = true
      if kanryo == "true"
        kanryo_bool = true
      else
        kanryo_bool = false
      end
      where('kanryo = ?', kanryo_bool)
    end
  }

  def kigengire?
    result = false
    if kanryo == false && Date.today > self.kigen
      result = true
    end
    result
  end

end
