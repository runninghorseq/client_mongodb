class ClientOld < ApplicationRecord
  self.table_name = 'clients'
  def new_entity_values
    new_entity_values = []

    entity_values.each do |k, v|
      hash = {}
      key_name = Base64.decode64(k)
      variable_name = key_name.split /_[^_]*_[^_]*$/
      version = key_name.split("_")[key_name.split("_").length - 2]
      original_service_id = key_name.split("_").last
      service = Service.find_by_original_service_id_and_version(original_service_id, version)
      variable_name = variable_name.first.force_encoding(Encoding::UTF_8)
      hash[:value] = v
      begin
        hash[:entity_id] = find_entity(service.id, variable_name).id
      rescue => e
        Rails.logger.error(e)
        Rails.logger.error(variable_name)
      end
      hash[:service_id] = service.id
      hash[:name] = variable_name
      new_entity_values << hash
    end
    new_entity_values
  end
  # self.entity_values = new_entity_values

  # def entities
  #   entity_values.map do |k, v|
  #     key_name = Base64.decode64(k)
  #     variable_name = key_name.split /_[^_]*_[^_]*$/
  #     entity = find_entity variable_name
  #     v = "" if entity.present? && entity.type == "PasswordEntity"
  #     {
  #       name: variable_name.first.force_encoding(Encoding::UTF_8),
  #       value: v
  #     }
  #   end
  # end

  def find_entity service_id, variable_name
    Entity.where(variable_name: variable_name, service_id: service_id, system_created: false, duplicate_from_entity_id: nil).first
  end
end
