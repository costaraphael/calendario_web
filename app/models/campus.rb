class Campus < ActiveRecord::Base
  def to_s
    "#{sigla} - #{nome}"
  end
end
