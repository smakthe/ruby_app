# this is the main file, the entry point of the application

# requiring the Output module
require_relative 'lib\output'

# taking the first argument from the command line inputs which is the name of the logfile
filename = ARGV[0]

# rescue block begins which opens the file and read its contents
begin
  file_content = File.read(filename)
rescue Errno::ENOENT    # if there is no file with the given name
  puts 'File not found'
else
  Output.print_result(file_content)   # calling the Output module for printing the result
end
