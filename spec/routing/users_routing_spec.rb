require "rails_helper"
RSpec.describe "Routing for Users", type: :routing do
  it "Restful routes" do
    expect(get("/users")).to route_to("users#index")
    expect(post("/users")).to route_to("users#create")
    expect(get("/users/new")).to route_to("users#new")
    expect(get("/users/1/edit")).to route_to("users#edit", id: "1")
    expect(get("/users/1")).to route_to("users#show", id: "1")
    expect(patch("/users/1")).to route_to("users#update", id: "1")
    expect(delete("/users/1")).to route_to("users#destroy", id: "1")
  end

  it "Routing for member" do
    expect(get("/users/1/person")).to route_to("users#person", id: "1")
    expect(get("/users/1/profile")).to route_to("users#profile", id: "1")
  end

  it "Routing for nested" do
    expect(get("/users/1/articles")).to route_to("articles#index", user_id: "1")
    expect(post("users/1/articles")).to route_to("articles#create", user_id: "1")
    expect(get("users/1/articles/new")).to route_to("articles#new", user_id: "1")
    expect(get("users/1/articles/1/edit")).to route_to("articles#edit", user_id: "1", id: "1")
    expect(get("users/1/articles/1")).to route_to("articles#show", user_id: "1", id: "1")
    expect(patch("users/1/articles/1")).to route_to("articles#update", user_id: "1", id: "1")
    expect(delete("users/1/articles/1")).to route_to("articles#destroy", user_id: "1", id: "1")
  end

  it "Routing for No-Restful" do
    expect(post("/get_sms_code")).to route_to("users#get_sms_code")
    expect(get("signup")).to route_to("users#new")
  end

  it "Routing for Admin" do
    expect(get("admin/users")).to route_to("admin/users#index")
    expect(post("admin/users")).to route_to("admin/users#create")
    expect(get("admin/users/new")).to route_to("admin/users#new")
    expect(get("admin/users/1/edit")).to route_to("admin/users#edit", id: "1")
    expect(get("admin/users/1")).to route_to("admin/users#show", id: "1")
    expect(patch("admin/users/1")).to route_to("admin/users#update", id: "1")
    expect(delete("admin/users/1")).to route_to("admin/users#destroy", id: "1")
  end

  it "Customer routing for Admin " do
    expect(get("admin/users/1/rencent_new_user")).to route_to("admin/users#rencent_new_user", id: "1")
    expect(get("admin/signup")).to route_to("admin/users#new")
  end
end