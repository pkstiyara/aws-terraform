#!/bin/bash
cd node
terraform apply -auto-approve

cd ../jenkins
terraform apply -auto-approve

