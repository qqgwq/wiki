require "rails_helper"
RSpec.describe "Routing for Comments", type: :routing do
  it "routes /comments to comments#index" do
    expect(get("articles/1/comments")).to route_to("comments#index", article_id: "1")
  end

  it "routes /comments to comments#create" do
    expect(post("articles/1/comments")).to route_to("comments#create", article_id: "1")
  end

  it "routes /comments to comments#new" do
    expect(get("articles/1/comments/new")).to route_to("comments#new", article_id: "1")
  end

  it "routes /comments to comments#edit" do
    expect(get("articles/1/comments/1/edit")).to route_to("comments#edit", article_id: "1", id: "1")
  end

  it "routes /comments to comments#show" do
    expect(get("articles/1/comments/1")).to route_to("comments#show", article_id: "1", id: "1")
  end

  it "routes /comments to comments#update" do
    expect(patch("articles/1/comments/1")).to route_to("comments#update", article_id: "1", id: "1")
  end  

  it "routes /comments to comments#destroy" do
    expect(delete("articles/1/comments/1")).to route_to("comments#destroy", article_id: "1", id: "1")
  end

  describe "admin console comments" do
    it "routes /admin to comments#index" do
      expect(get("admin/comments")).to route_to("admin/comments#index")
    end
  end
end
