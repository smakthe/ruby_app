# this is the spec file for Regex module containing testcases to check all the regular expressions

require_relative '../lib/regex'

describe Regex do
  it 'should match with the correct URL pattern' do
    expect(Regex::PAGE_URL).to match('/home ')
    expect(Regex::PAGE_URL).to match('/about/2 ')
  end

  it 'should not match with any incorrect URL pattern' do
    expect(Regex::PAGE_URL).not_to match('index')
    expect(Regex::PAGE_URL).not_to match('//about/2 ')
  end

  it 'should match with a valid IP address' do
    expect(Regex::IP_ADDRESS).to match('744.228.933.232')
    expect(Regex::IP_ADDRESS).to match('033.182.799.319')
  end

  it 'should not match with an invalid IP address' do
    expect(Regex::IP_ADDRESS).not_to match('744.22..933.232')
    expect(Regex::IP_ADDRESS).not_to match('512.4255.285.530')
  end
end
