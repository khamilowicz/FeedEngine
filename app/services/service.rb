
module Service

  def self.create service, identifier=nil
    service_klass = if identifier
                      service
                    else
                      identifier = service.identifier
                      service.service
                    end.to_s.capitalize + 'Feed'
    service_klass.constantize.new(source: identifier)
  end
end