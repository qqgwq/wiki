require "grape-swagger"
module V1
  class Root < Grape::API
    format :json
    formatter :json, Grape::Formatter::ActiveModelSerializers
    
    helpers V1::Helpers
    mount V1::Users
    mount V1::Articles
    mount V1::Likes
    mount V1::Categories
    mount V1::Comments

    add_swagger_documentation(
        api_version: "v1",
        hide_documentation_path: true,
        mount_path: "/api",
        hide_format: true
        )
  end
end