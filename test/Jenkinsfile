pipeline {
    agent {
        node {
            label 'master'
        }
    }
    stages {
        stage ('terraform started') {
            steps {
                sh 'echo "started. '
            }
        }
        stage ('Git clone') {
            steps {
                sh 'sudo rm -f *;sudo git clone https://github.com/awsyadav/terra-test.git'
            }
        }
        stage ('tfvars create') {
            steps {
                sh 'sudo cp /home/ec2-user/vars.tf ./jenkins/' 
            }
        }
        stage ('terraform init') {
            steps {
                sh 'sudo /home/ec2-user/terraform init ./jenkins'
            }
        }
          stage ('terraform plan') {
            steps {
                sh 'ls ./jenkins; sudo /home/ec2-user/terraform plan ./jenkins'
            }
    }
    }
    }
