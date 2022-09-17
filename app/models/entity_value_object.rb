class EntityValueObject
  attr_reader :entity_id, :value

  def initialize(entity_id, value)
    @entity_id, @value = entity_id, value
  end

  # Converts an object of this instance into a database friendly value.
  # In this example, we store the values in the database as array.
  def mongoize
    [entity_id, value]
  end

  class << self

    # Takes any possible object and converts it to how it would be
    # stored in the database.
    def mongoize(object)
      case object
      when EntityValueObject then object.mongoize
      when Hash then EntityValueObject.new(object[:entity_id], object[:value]).mongoize
      else object
      end
    end

    # Get the object as it was stored in the database, and instantiate
    # this custom class from it.
    def demongoize(object)
      EntityValueObject.new(object[0], object[1])
    end

    # Converts the object that was supplied to a criteria and converts it
    # into a query-friendly form.
    def evolve(object)
      case object
      when EntityValueObject then object.mongoize
      else object
      end
    end
  end
end
