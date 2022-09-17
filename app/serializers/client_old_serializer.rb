class ClientOldSerializer < ActiveModel::Serializer
  attributes :id, :user_id_in_chat_application, :nickname, :bot, :created_at, :updated_at, :chat_application_id, :user_id, :original_service_id,
             :end_user_id, :last_updated_at, :profile_pic, :timezone, :locale, :line_nonce, :conversations_count, :entity_values,
  :linked_client_rich_menu_id, :old_id

  def entity_values
    object.new_entity_values
  end

  def id
    object.uuid
  end

  def old_id
    object.id
  end

end
