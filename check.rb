require 'rubygems'
require 'mechanize'
Pnr_no=4150702245
agent = Mechanize.new
page = agent.get('http://www.indianrail.gov.in/pnr_Enq.html')
form = agent.page.forms[0]
print agent.page.forms[0].fields
agent.page.forms[0]["lccp_pnrno1"] = Pnr_no
button = agent.page.forms[0].button_with(:value => "Get Status")
# submit the form using the button
pages=agent.submit(form, button)
#train number query
puts pages.at('table.table_border').search('.//tr[3]/td[1]').text
#Journey date
puts pages.at('table.table_border').search('.//tr[3]/td[3]').text
#starting station
puts pages.at('table.table_border').search('.//tr[3]/td[4]').text
#end Station
puts pages.at('table.table_border').search('.//tr[3]/td[5]').text
#current status -seat no
puts pages.at('.//table[@id="center_table"]/tr[2]/td[2]').text
