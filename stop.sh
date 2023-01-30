#!/bin/bash
cd node
terraform destroy -auto-approve

cd ../jenkins
terraform destroy -auto-approve

