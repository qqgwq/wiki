module V1
  class Categories < Grape::API
    format :json
    namespace :categories do
      get "category" do
        Category.all
      end
    end
  end
end