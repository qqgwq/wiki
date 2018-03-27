require "rails_helper"
RSpec.describe "Routing for Articles" do
  it "routes articles to articles#index" do
    expect(get("/")).to route_to("articles#index")
    expect(get("/articles")).to route_to("articles#index")
  end

  it "routes articles to articles#create" do
    expect(post("/articles")).to route_to("articles#create")
  end

  it "route articles to articles#new" do
    expect(get("/articles/new")).to route_to("articles#new")
  end

  it "route articles to articles#edit" do
    expect(get("/articles/1/edit")).to route_to("articles#edit", id: "1")
  end

  it "route articles to articles#show" do
    expect(get("/articles/1")).to route_to("articles#show", id: "1")
  end

  it "route articles to articles#update" do
    expect(patch("/articles/1")).to route_to("articles#update", id: "1")
  end

  it "route articles to articles#destroy" do
    expect(delete("/articles/1")).to route_to("articles#destroy", id: "1")
  end


  it "Routing for collection" do
    expect(get("/users/1/articles/release")).to route_to("articles#release", user_id: "1")
  end


  describe "Routing for admin articles" do
    it "admin complete articles to articles#complete" do
      expect(patch("/admin/articles/1/complete")).to route_to("admin/articles#complete", id: "1")
    end

    it "admin deny articles to articles#deny" do
      expect(post("/admin/articles/1/deny")).to route_to("admin/articles#deny", id: "1")
    end

    it "routes console articles to articles#index" do
      expect(get("/admin/articles/")).to route_to("admin/articles#index")
    end

    it "routes console show articles to articles#show" do
      expect(get("/admin/articles/1")).to route_to("admin/articles#show", id: "1")
    end

    it "routes console articles to articles#destroy" do
      expect(delete("/admin/articles/1")).to route_to("admin/articles#destroy", id: "1")
    end
  end
end