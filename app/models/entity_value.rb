class EntityValue
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::History::Trackable

  field :entity_id, type: Integer
  field :name, type: String
  field :value, type: String
  field :service_id, type: Integer
  embedded_in :client, class_name: 'Client', :inverse_of => :entity_values
  # track_history :on => [:entity_id, :value], :scope => :client, :track_destroy => true, :track_update => true

end
