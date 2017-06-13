require "grape-swagger"
module V1
  class Root < Grape::API
    format :json
    formatter :json, Grape::Formatter::ActiveModelSerializers
    
    mount V1::Users
    mount V1::Articles

    add_swagger_documentation(
        api_version: "v1",
        hide_documentation_path: true,
        mount_path: "/api/v1/swagger_doc",
        hide_format: true
        )
  end
end