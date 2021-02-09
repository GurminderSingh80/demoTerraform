# demoTerraform

Pre-requisite: Terrafom binary is required

Execution:

1) Terraform init
2) Terraform plan
3) Terraform apply

Provide Secret and Access keys of the aws user while running Terraform plan/apply

for ex:

demo % terraform apply
var.AWS_ACCESS_KEY
  Enter a value: <access key>
var.AWS_SECRET_KEY
  Enter a value: <secret key>
  
On completing execution ELB dns will be provided to acccess webservice, prometheus and grafana

ex:
Outputs:

ELB = my-elb-782219157.ap-southeast-2.elb.amazonaws.com

Applications can be accessed using links as:

 Webservice:
 http://<ELB Output>:8080/cat
  
 Prometheus
 http://<ELB Output>:9090
  
 Grafana 
 http://<ELB Output>:3000
