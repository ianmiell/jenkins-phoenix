from jenkinsapi.jenkins import Jenkins                                                                                                                                        
from jenkinsapi.credential import UsernamePasswordCredential, SSHKeyCredential                                                                                                
                                                                                                                                                                              
api = Jenkins('http://jenkins:8080')                                                                                                                                          
# Get a list of all global credentials                                                                                                                                        
creds = api.credentials                                                                                                                                                       
credentialsId = creds.credentials.keys()[0]  

import socket
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect(('jenkins',9001))
s.send('CREDENTIALSID ' + credentialsId)


