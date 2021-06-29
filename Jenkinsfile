pipeline {
    agent any
    parameters {
        string(name: 'project_name', defaultValue: 'Packer Pipeline', description: 'Jenkins Pipeline for Packers')
        string(name: "git_codebase", defaultValue: "git@ec2-18-200-215-85.eu-west-1.compute.amazonaws.com:ibm-admin/sastoaws-infra.git", description: "git location of the terraform config files")
        string(name: "main_dir_name", defaultValue: "SAS_to_S3_Project/main", description: "main directory to execute terraform main.tf from")
        string(name: "tf_vars", defaultValue: "", description: "TF vars to be passed in TF command. ex - image_id=ami-abc123")
    }
    environment {
        packer_version = '1.4.3'
        // access_key = 'input_your_access_key'
        // secret_key = 'input_your_secret_key'
    }
    stages {
          stage('Install Packer') {
              steps {
                    sh "sudo yum install wget zip -y"
                    sh "cd /tmp"
                    sh "curl -o bin_packer.zip https://releases.hashicorp.com/packer/$packer_version/packer_'$packer_version'_linux_amd64.zip"
                    sh "unzip bin_packer.zip"
                    sh "sudo mv packer /usr/bin"
                    sh "rm -rf bin_packer.zip"
                    sh "packer version"
              }
          }
          stage('code checkout') {
               steps {
                    git branch: 'master', url: 'https://github.com/aleti-pavan/packer-ansible-terraform-demo.git'
                    }
          }
          stage('Build AMI') {
                steps {
                    dir('./packer'){
                     sh 'ls -la; pwd; packer build template.json'
                    }
                }
          }
          stage('Deploy??') {
                steps {
                    script {
                       timeout(time: 2, unit: 'MINUTES') {
                          input(id: "Deploy Gate", message: "Want to Deploy ${params.project_name}?", ok: 'Deploy??')
                       }
                    }
                }
          }
         stage('Terraform Deploy'){
             steps {
                 dir('./terraform'){

                 sh  """
                     terraform init; terraform plan; terraform apply -auto-approve -var 'access_key=$access_key' -var 'secret_key=$secret_key'
                     """

                 }

             }
         }
    }
}