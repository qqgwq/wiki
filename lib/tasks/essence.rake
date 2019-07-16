require 'http'
require 'nokogiri'

RUBY_CHINA_ENDPOINT = 'https://ruby-china.org'

namespace :essence do
  task :daily_essence => :environment do
    crawler
  end
end

def crawler
  before_titles = []
  (1..31).each do |p|
    parsed_page = Nokogiri::HTML(open("https://ruby-china.org/topics/excellent?page=#{p}"))
    topics = parsed_page.css("div.title a")
    topics.each do |topic|
      title = topic['title']
      url = endpoint + topic['href']
      before_titles.push({title: title, url: url})
    end
  end
 
  before_titles.each do |title|
    article = Article.new(title.merge(user_id: 1))
    article.save(:validate => false)
  end
end

def endpoint
  RUBY_CHINA_ENDPOINT
end