# frozen_string_literal: true

class PagesController < ApplicationController
  require 'rss'
  require 'open-uri'
  URL = 'https://kurs.com.ua/novosti/rss/feed-18.xml'

  def home
    get_rss(3)
  end

  def show
    get_rss(10)
    render template: "pages/#{params[:page]}"
  end

  private

  def get_rss(count)
    open(URL) do |rss|
      @feed = RSS::Parser.parse(rss, false)
    end
    @news = @feed.items.first(count)
  end
end
