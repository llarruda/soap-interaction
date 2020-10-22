require 'rubygems'
require 'savon'

WSDL = 'https://apps.correios.com.br/SigepMasterJPA/AtendeClienteService/AtendeCliente?wsdl'

# create a client
client = Savon.client(
  wsdl: WSDL,
  env_namespace: :soapenv,
  pretty_print_xml: true,
  log: true
)

# two ways to list actions available on API
p client.operations
p client.wsdl.soap_actions

# DEBUG 
request = client.build_request(:consulta_cep, message: { cep: '70002900'}, soap_action: false)
puts request.headers
puts request.body


# act some action
response = client.call(:consulta_cep, message: { cep: '70002900' }, soap_action: false)

# the same call passing an raw XML
# response = client.call(:consulta_cep, xml: "<?xml version=\"1.0\" encoding=\"UTF-8\"?><soapenv:Envelope xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:tns=\"http://cliente.bean.master.sigep.bsb.correios.com.br/\" xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\"><soapenv:Body><tns:consultaCEP><cep>70002900</cep></tns:consultaCEP></soapenv:Body></soapenv:Envelope>", soap_action: false)
