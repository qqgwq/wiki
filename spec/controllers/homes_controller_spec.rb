require "rails_helper"

RSpec.describe HomesController, type: :controller do
  describe "#New" do
    it "test new action" do
      @home = Home.new
      expect(@home).to be_a_new(Home)
    end
  end

  describe "#About" do
    it "test about action" do
      @home = Home.first
      expect(@home).to eq(Home.first)
    end
  end
end