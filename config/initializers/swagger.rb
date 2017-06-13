GrapeSwaggerRails.options.url      = '/swagger_doc'
GrapeSwaggerRails.options.app_url  = '/api/v1/swagger_doc'
GrapeSwaggerRails.options.app_name = 'Circle'

GrapeSwaggerRails.options.before_action do
GrapeSwaggerRails.options.app_url = request.protocol + request.host_with_port + '/api/v1'
end 