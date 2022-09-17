class Order
  include Mongoid::Document

  field :state, type: :integer
  # Equivalent to:
  field :state, type: "integer"
  # Equivalent to:
  field :state, type: Integer
end