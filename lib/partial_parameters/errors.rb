class InvalidContextError < StandardError
  def to_s
    'Cannot find partial parameters, are you in the context of a partial?'
  end
end

class UnknownParametersError < StandardError
  def initialize(parameters)
    @parameters = parameters
  end

  def to_s
    "Unknown parameters: #{@parameters}"
  end
end

class MissingParameterError < StandardError
  def initialize(name)
    @name = name
  end

  def to_s
    "Missing required parameter #{@name}."
  end
end

class NoBlockGivenError < StandardError
  def to_s
    'No block given.'
  end
end
