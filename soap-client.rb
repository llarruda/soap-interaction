require 'rubygems'
require 'savon'

WS = 'http://www.gcomputer.net/webservices/dilbert.asmx?WSDL'

# create a client
client = Savon.client(
  wsdl: WS
)

# two ways to list actions available on API
puts client.wsdl.soap_actions

puts client.operations

# act some action
response = client.call(:daily_dilbert, message: {ADate: 'Thu, Oct 22, 2020 11:13:52 AM'})

puts response.class
p response
