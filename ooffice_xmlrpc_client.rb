require 'xmlrpc/client'
require 'pp'

#server = XMLRPC::Client.new("localhost", '/', 1209 )
#pp server

client = XMLRPC::Client.new("localhost", '/', 1209 )
client.set_parser(XMLRPC::XMLParser::XMLParser.new)
@oof = client.proxy()

#result = server.call("create_document")
result = @oof.create_document
pp result

#result = server.call( "put_text", "testovací text" )
result = @oof.put_text( "<h1>" )
result = @oof.put_text( "testovací text" )
pp result

#result = server.call( "save_and_close", "/tmp/ooffice_remote.doc" )
result = @oof.save_and_close( "/tmp/ooffice_remote.doc" )
pp result

