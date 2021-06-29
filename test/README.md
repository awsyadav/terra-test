# Amazon Simple Notification Service

Amazon Simple Notification Service (SNS) is a cloud service for coordinating the delivery of push messages from software applications to subscribing endpoints and clients.
All messages published to Amazon SNS are warehoused across several availability zones to prevent loss.

To get started with Amazon SNS, developers first have to create a topic, which is an access point for subscribers who are interested in receiving notifications about a specific subject.
Developers publish a message to a topic when they have an update for subscribers and this action prompts Amazon SNS to distribute the message to all appropriate subscribers

# Project structure

    ├──  sns-deployment-templates                
    ├──  ├── terraform
    |        └── backend.tf               # Storing tfstate in s3 bucket
    |        └── sns.tf                  # sns topic resource
    ├── Jenkinsfile                       # pipeline for sns deployment
    └── README.md
            
