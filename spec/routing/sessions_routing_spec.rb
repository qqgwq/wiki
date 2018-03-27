require "rails_helper"
RSpec.describe "Routing for Sessions", type: :routing do
  it "routes /sessions to sessions#create" do
    expect(post("/sessions")).to route_to("sessions#create")
  end

  it "routes /sessions to sessions#destroy" do
    expect(delete("/sessions/1")).to route_to("sessions#destroy", id: "1")
  end

  it "routes /login" do
    expect(get("login")).to route_to("sessions#new")
  end

  it "routes /login" do
    expect(post("/login")).to route_to("sessions#create")
  end

  it "routes /logout" do
    expect(delete("/logout")).to route_to("sessions#destroy")
  end

  it "routes admin to login" do
    expect(get("/admin/login")).to route_to("admin/sessions#new")
  end


  it "routes admin to login" do
    expect(post("/admin/login")).to route_to("admin/sessions#create")
  end

  it "routes admin to logout" do
    expect(delete("/admin/logout")).to route_to("admin/sessions#destroy")
  end
end