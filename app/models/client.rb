class Client
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::History::Trackable

  field :original_service_id, type: Integer
  # table key: :original_service_id, capacity_mode: :on_demand
  field :id, type: String
  field :user_id_in_chat_application, type: String
  field :nickname, type: String
  field :bot, type: String
  field :chat_application_id, type: String
  field :user_id, type: String
  field :uuid, type: String
  field :end_user_id, type: String
  field :last_updated_at, type: DateTime
  field :profile_pic, type: String
  field :timezone, type: String
  field :locale, type: String
  field :gender, type: String
  field :line_nonce, type: String
  field :conversations_count, type: String
  field :linked_client_rich_menu_id, type: String
  field :user_agent, type: String
  field :device_type, type: String
  field :symphony_user_id, type: String
  field :email, type: String
  field :line_user_id, type: String
  field :old_id, type: String

  # before_save :generate_id
  #
  # field :entity_values, type: EntityValueObject
  embeds_many :entity_values, class_name: 'EntityValue', inverse_of: :client, cascade_callbacks: true
  embeds_many :segments, cascade_callbacks: true

  # telling Mongoid::History how you want to track changes
  # dynamic fields will be tracked automatically (for MongoId 4.0+ you should include Mongoid::Attributes::Dynamic to your model)
  # track_history :on => [:entity_values],
  #               :modifier_field => :modifier, # adds "belongs_to :modifier" to track who made the change, default is :modifier, set to nil to not create modifier_field
  #               :modifier_field_inverse_of => :nil, # adds an ":inverse_of" option to the "belongs_to :modifier" relation, default is not set
  #               :modifier_field_optional => true, # marks the modifier relationship as optional (requires Mongoid 6 or higher)
  #               :version_field => :version, # adds "field :version, :type => Integer" to track current version, default is :version
  #               :track_create  => false,       # track document creation, default is true
  #               :track_update => true, # track document updates, default is true
  #               :track_destroy => true # track document destruction, default is true

end
