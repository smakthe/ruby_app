# this is the spec file for Parser class containing testcases to check all the methods

require_relative '..\lib\parser'

describe Parser do
  it 'would create a new parser object, an instance of the Parser class' do
    new_parser_object = Parser.new
    expect(new_parser_object.class).to eq(Parser)
  end

  it 'would return the pages alogwith their frequency in a hash' do
    File.open('test.log', 'w') do |file_pointer|
      file_pointer.write "/home 235.313.352.950\n/contact 184.123.665.067\n/contact 543.910.244.929"
    end
    test_file = File.read('test.log')
    parser = Parser.new(test_file)
    expect(parser.send(:calculate_page_frequency)).to eq({ '/home ' => 1, '/contact ' => 2 })
  end

  it 'would return the pages with corresponding frequency in a hash sorted by frequency in descending order' do
    File.open('test.log', 'w') do |file_pointer|
      file_pointer.write "/home 235.313.352.950\n/contact 184.123.665.067\n/contact 543.910.244.929"
    end
    test_file = File.read('test.log')
    parser = Parser.new(test_file)
    expect(parser.calculate_most_viewed_pages).to eq({ '/contact ' => 2, '/home ' => 1 })
  end

  it 'would return the pages alongwith the array of ip addresses that visited them in a hash' do
    File.open('test.log', 'w') do |file_pointer|
      file_pointer.write "/home 235.313.352.950\n/contact 184.123.665.067\n/contact 543.910.244.929"
    end
    test_file = File.read('test.log')
    parser = Parser.new(test_file)
    expected_hash = { '/home ' => ['235.313.352.950'], '/contact ' => ['184.123.665.067', '543.910.244.929'] }
    expect(parser.send(:calculate_ip_frequency_per_page)).to eq(expected_hash)
  end

  it 'would return the pages with corresponding unique views frequency in a hash sorted by unique views frequency' do
    File.open('test.log', 'w') do |file_pointer|
      file_pointer.write "/home 235.313.352.950\n/contact 184.123.665.067\n/contact 543.910.244.929"
    end
    test_file = File.read('test.log')
    parser = Parser.new(test_file)
    expect(parser.calculate_unique_page_views).to eq({ '/contact ' => 2, '/home ' => 1 })
  end
end
