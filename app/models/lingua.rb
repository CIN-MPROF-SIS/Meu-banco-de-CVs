class Lingua < ActiveRecord::Base
  def to_s
      return self.descricao
  end
end
