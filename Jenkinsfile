pipeline {

agent any

stages {

stage(‘Checkout’) {

steps {

checkout([$class: ‘GitSCM’, branches: [[name: ‘*/jenkins’]], extensions: [], userRemoteConfigs: [[url: ‘https://github.com/pkstiyara/aws-terraform.git‘]]])

}

}

stage (“terraform init”) {

steps {

sh (‘terraform init’)

}

}

stage (“terraform Action”) {

steps {

echo “Terraform action is –> ${action}”

sh (‘terraform ${action} –auto-approve’)

}

}

}

}
