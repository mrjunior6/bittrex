module Bittrex
  class Markethistory
    attr_reader :market, :id, :timestamp, :quantity, :price, :total, :filltype, :ordertype, :raw

    def initialize(attrs = {})
      @id           = attrs["Id"]
      @timestamp    = Time.parse(attrs["TimeStamp"])
      @quantity     = attrs["Quantity"]
      @price        = attrs["Price"]
      @total        = attrs["Total"]
      @filltype     = attrs["FillType"]
      @ordertype    = attrs["OrderType"]
      @raw          = attrs
    end

    def self.current(market)
      client.get('public/getmarkethistory', market: market).map{|data| new(data) }
    end

    private

    def self.client
      @client ||= Bittrex.client
    end
  end
end

