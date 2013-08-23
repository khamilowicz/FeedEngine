
module Service

  def self.create service, identifier=nil
    if identifier
      service_klass = service.to_s.capitalize + 'Feed'
    else
      service_klass = service.service.to_s.capitalize + 'Feed'
      identifier = service.identifier
    end
    service_klass = service_klass.constantize
    service_klass.new(source: identifier)
  end
end