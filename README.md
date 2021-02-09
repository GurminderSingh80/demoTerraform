# demoTerraform

*Pre-requisite:* Terraform should be set-up and running

__Execution Steps:__

Please run the below commands, 

1) Terraform init
2) Terraform plan
3) Terraform apply

For Terraform plan and apply commands, please enter the Secret and Access key of your AWS user

_For an instance,_

demo % terraform apply
var.AWS_ACCESS_KEY
  Enter a value: <access key>
var.AWS_SECRET_KEY
  Enter a value: <secret key>
  
On completing of execution steps, ELB dns will be avaible to acccess webservice, prometheus and grafana on the screen similar to as below -
```
> Outputs:

> ELB = my-elb-782219157.ap-southeast-2.elb.amazonaws.com
```
Please copy the ELB output from your screen and form the applications links as:

 Webservice:
 http:// _ELB output_:8080/cat
  
 Prometheus
 http:// _ELB output_:9090
  
 Grafana   
 http:// _ELB output_:3000

 Kindly note, it might take a few minutes for application to be availble.
