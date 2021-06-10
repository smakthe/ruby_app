# The Ruby Logfile Parser

## Introduction

This is the ruby logfile parser which takes a logfile containing visited websites and the IP from where it has been requested as input and produces the following output:

`1. The list of webpages with most page views ordered from most pages views to less page views`

`2. The list of webpages with most unique page views also ordered`

## Setup

After cloning the project execute the command ```bundle instal``` to install the gems from the Gemfile

Run ```ruby main.rb webserver.log``` to start the application

## Testing

All the testcases are located under the `spec` directory in the project. Run the command ```rspec``` to run all the testcases