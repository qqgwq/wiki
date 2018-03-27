require "rails_helper"

RSpec.describe "Routing for Likes", type: :routing do
  it "routes likes to article likes#destroy" do
    expect(delete("/articles/1/like")).to route_to("likes#destroy", article_id: "1")
  end

  it "routes likes to likes#create" do
    expect(post("articles/1/like")).to route_to("likes#create", article_id: "1")
  end

  it "route likes to comment likes#destroy" do
    expect(delete("articles/1/comments/1/like")).to route_to("likes#destroy", article_id: "1", comment_id: "1")
  end

  it "route likes to comment likes#create" do
    expect(post("articles/1/comments/1/like")).to route_to("likes#create", article_id: "1", comment_id: "1")
  end
end