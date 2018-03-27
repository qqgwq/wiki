require "rails_helper"
RSpec.describe "Routing for Notifications", type: :routing do
  it "routes /notifications to notifications#mark" do
    expect(post("notifications/mark")).to route_to("notifications#mark")
  end

  it "routes /notifications to notifications#clear" do
    expect(delete("notifications/clear")).to route_to("notifications#clear")
  end

  it "routes /notifications to notifications#index" do
    expect(get("/notifications")).to route_to("notifications#index")
  end

  it "routes /notifications to notifications#destroy" do
    expect(delete("notifications/1")).to route_to("notifications#destroy", id: "1")
  end
end