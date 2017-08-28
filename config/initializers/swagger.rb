GrapeSwaggerRails.options.url = '/api'
GrapeSwaggerRails.options.app_url  = "#{ENV['http://192.168.10.113:3000/api']}"
GrapeSwaggerRails.options.app_name = 'Wiki接口文档'

GrapeSwaggerRails.options.before_action do
  GrapeSwaggerRails.options.app_url = request.protocol + request.host_with_port + '/api'
end 