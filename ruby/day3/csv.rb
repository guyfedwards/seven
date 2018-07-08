require "ostruct"

module ActsAsCsv
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end

  module InstanceMethods
    def read
      @csv_contents = []
      filename = self.class.to_s.downcase + '.txt'
      file = File.new(filename)
      @headers = file.gets.chomp.split(', ')

      file.each do |row|
        @csv_contents << row.chomp.split(', ')
      end
    end

    def each(&block)
      ### Alt solution using OpenStruct
      # csv_contents.each do |row|
      #   hash = Hash[headers.zip(row)]
      #   struct = OpenStruct.new hash

      #   block.call struct
      # end

      csv_contents.each do |row|
        hash = Hash[headers.zip(row)]
        r = Csvrow.new hash

        block.call r
      end
    end

    attr_accessor :headers, :csv_contents
    def initialize
      read
    end
  end
end

class Csvrow
  attr_accessor :row

  def method_missing(name, *args)
    puts 'name', name, args
    row[name]
  end

  def initialize(row)
    @row = row
  end
end

class RubyCsv
  include ActsAsCsv
  acts_as_csv
end

m = RubyCsv.new
# puts m.headers.inspect
# puts m.csv_contents.inspect
m.each { |row| puts row.one }
