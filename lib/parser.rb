# this is the Parser class. It takes the logfile as input, parse it and produces the following outputs:
# 1. A hash of webpages with no of visits sorted in descending order
# 2. A hash of webpages with no of unique visits sorted in descending order

# requiring the Regex module
require_relative 'regex'

class Parser
  # this is the constructor method of the Parser class. If present, it initializes an instance variable with the input data
  def initialize(file_content = nil)
    @data = file_content if file_content
  end

  # this method returns the sorted hash of webpages with no of visits based on no of visits in descending order
  def calculate_most_viewed_pages
    pages_with_frequency = calculate_page_frequency
    pages_with_frequency.sort_by { |_key, value| value }.reverse.to_h
  end

  # this method returns the sorted hash of webpages with no of unique visits based on no of unique visits in descending order
  def calculate_unique_page_views
    ip_frequency_per_page = calculate_ip_frequency_per_page
    ip_frequency_per_page.transform_values { |value| value.uniq.length }.sort_by { |_key, value| value }.reverse.to_h
  end

  private

  # this is a private method for returning the hash of pages and their corresponding frequency of visits
  def calculate_page_frequency
    page_frequency_hash = {}
    pages_array = []
    @data.split("\n").each do |line|
      pages_array << line.match(Regex::PAGE_URL)[0] if line =~ Regex::PAGE_URL
    end
    pages_array.each do |page|
      page_frequency_hash[page].nil? ? page_frequency_hash[page] = 1 : page_frequency_hash[page] += 1
    end
    page_frequency_hash
  end

  # this is a private method for returning the hash of pages and their corresponding frequency of unique visits
  def calculate_ip_frequency_per_page
    ip_frequency_per_page_hash = {}
    @data.split("\n").each do |line|
      page_url = line.match(Regex::PAGE_URL)[0] if line =~ Regex::PAGE_URL
      ip_frequency_per_page_hash[page_url] = [] unless ip_frequency_per_page_hash[page_url]
      ip_frequency_per_page_hash[page_url] << line.match(Regex::IP_ADDRESS)[0] if line =~ Regex::IP_ADDRESS
    end
    ip_frequency_per_page_hash
  end
end
