# this is the Regex module which contains the following constants:
# 1. A regular expression which matches the URL pattern such as '/home ' or '/about/2 '
# 2. A regular expression which matches the IP address format such as 277.361.998.118 or 022.113.771.209
# note: the constants are immutable because of the use of 'freeze' method

module Regex
  PAGE_URL = /^\/\w+(?:\/\w+)*\ /i.freeze
  IP_ADDRESS = /(\d{3}\.?){4}$/.freeze
end
