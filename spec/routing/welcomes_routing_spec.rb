require "rails_helper"
RSpec.describe "Routing for Welcomes", type: :routing do
  it "routes /admin/welcomes#index " do
    expect(get("/welcome")).to route_to("welcomes#index")
    expect(get("/admin")).to route_to("admin/welcomes#index")
  end

  it "routes /admin/welcomes#create" do
    expect(post("admin/welcomes")).to route_to("admin/welcomes#create")
  end

  it "routes /admin/welcomes#new" do
    expect(get("admin/welcomes/new")).to route_to("admin/welcomes#new")
  end

  it "routes /admin/welcomes#edit" do
    expect(get("/admin/welcomes/1/edit")).to route_to("admin/welcomes#edit", id: "1")
  end

  it "routes /admin/welcomes#show" do
    expect(get("/admin/welcomes/1")).to route_to("admin/welcomes#show", id: "1")
  end

  it "routes /admin/welcomes#update" do
    expect(patch("/admin/welcomes/1")).to route_to("admin/welcomes#update", id: "1")
  end

  it "routes /admin/welcomes#destroy" do
    expect(delete("/admin/welcomes/1")).to route_to("admin/welcomes#destroy", id: "1")
  end
end 