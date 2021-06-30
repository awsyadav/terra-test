pipeline {
    agent any
    parameters {
        string(name: 'project_name', defaultValue: 'Packer Pipeline', description: 'Jenkins Pipeline for Packers')
        string(name: "git_codebase", defaultValue: "https://github.com/awsyadav/terra-test.git", description: "git location of packer config files")
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
                    sh "sudo yum install -y yum-utils"
                    sh "sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo"
                    sh "sudo yum -y install packer"
                    sh "packer version"
              }
          }
          stage('code checkout') {
               steps {
                    git credentialsId: '628ccbff-7941-4ae6-8687-aabf673d5ac8', url: "${params.git_codebase}"
                    }
          }
          stage('Build AMI') {
                steps {
                    dir('./packer'){
                     sh 'ls -la; pwd; packer build template.json'
                    }
                }
          }

    }
}
