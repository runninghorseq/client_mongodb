class Segment
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :color, type: String
  field :segment_id, type: Integer

end

