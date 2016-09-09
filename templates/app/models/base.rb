class Base < ApplicationRecord
  self.abstract_class = true

  use_switch_point :main

  def self.writable_transaction(&block)
    Base.transaction_with(Base, &block)
  end
end
