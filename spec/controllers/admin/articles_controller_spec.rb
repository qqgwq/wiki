require 'rails_helper'

describe ArticlesController do
  before do
    @article = Article.new
  end

  context 'All aritcles' do
    it 'List all aticles' do
      total = Article.all
      get 'index'
      expect(Article.all).to eq(total)
    end
  end
end