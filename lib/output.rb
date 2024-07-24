# this is the Output module which prints the following results:
# 1. list of webpages with most page views ordered from most pages views to less page views
# 2. list of webpages with most unique page views also ordered

# requiring the Parser class which is responsible for parsing the input file
require 'parser'

module Output
  def self.print_result(file_content)
    parser = Parser.new(file_content)
    print_most_viewed_pages(parser)
    print_most_unique_page_views(parser)
  end

  # this method prints the list of webpages with most page views in descending order
  def self.print_most_viewed_pages(parser)
    sorted_pages_with_frequency = parser.calculate_most_viewed_pages
    sorted_pages_with_frequency.each do |page, frequency|
      puts "#{page}#{frequency} visits"
    end
  end

  # this method prints the list of webpages with most unique page views in descending order
  def self.print_most_unique_page_views(parser)
    sorted_pages_with_unique_views = parser.calculate_unique_page_views
    sorted_pages_with_unique_views.each do |page, unique_views|
      puts "#{page}#{unique_views} unique views"
    end
  end
end
