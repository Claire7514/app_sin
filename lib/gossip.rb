require 'pry'
require 'csv'

class Gossip

  attr_accessor :author, :content, :name

  def initialize(author_init, content_init)
    @author = author_init
    @content = content_init
    @name = name
  end

  def save
    CSV.open("./db/gossip.csv", "ab") do |csv|
      csv << [@author, @content]
    end
  end

  def self.all
    all_gossips = []
    CSV.read("./db/gossip.csv").each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
    return all_gossips
  end

  def self.find(find_id)
    find_id = find_id.to_i
    gossip_found = nil
    Gossip.all.each do |one_gossip|
      (one_gossip.name.to_i == find_id)? gossip_found = one_gossip : ""
    end
    gossip_found
  end

end

