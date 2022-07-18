# frozen_string_literal: true

require 'feedjira'
require 'open-uri'
require 'sidekiq-scheduler'

class UpdateFeedsWorker
  include Sidekiq::Worker

  def perform(feed_id = nil)
    logger.info("feed id is #{feed_id}")
    if feed_id
      feed = Feed.find(feed_id)
      return unless feed

      update_feed(feed_id)
    else
      logger.info('Looking for all the updatable feed')
      Feed.all.each do |feed|
        update_feed(feed.id)
      end
    end
  end

  def update_feed(feed_id)
    logger.info("Trying to update a feed with id: #{feed_id}")
    feed = Feed.find(feed_id)
    return unless feed

    content = URI.open(feed.url).read
    entries = Feedjira.parse(content).entries
    entries.each do |item|
      checksum = Digest::MD5.hexdigest(Marshal.dump(item))
      next unless feed.feed_articles.where(hash_check: checksum).empty?

      article = FeedArticle.new(feed_id: feed.id)
      article.link = item.url
      article.pub_date = item.published
      article.hash_check = checksum
      entry_type = item.class.name

      case entry_type
      when 'Feedjira::Parser::AtomEntry'
        article.title = item.raw_title
        article.description = item.content
      when 'Feedjira::Parser::RSSEntry'
        article.title = item.title
        article.description = item.summary
      when 'Feedjira::Parser::AtomFeedBurnerEntry'
      else
        puts ' NOT supported feed'
      end
      article.save
    end
  rescue StandardError => e
    logger.error("Something happenened while reading the fees with url: #{feed&.url}")
  end
end
