require 'faraday'
require 'json'

API_URL = "http://www.sledsheet.com/api/v1/timesheets/"

module Sledsheet
  class Timesheet
    attr_reader :id, :name, :date, :status

    def initialize(attributes)
      @id = attributes["id"]
      @name = attributes["name"]
      @date = attributes["date"]
      @status = attributes["status"]
    end

    def self.all
      response = Faraday.get(API_URL)
      timesheets = JSON.parse(response.body)
      timesheets.map { |attributes| new(attributes) }
    end

    def self.find(id)
      response = Faraday.get("#{API_URL}/#{id}")
      attributes = JSON.parse(response.body)
      new(attributes)
    end
  end
end
