node {
    stages ('Get code') {
       stage('Build') {
               git credentialsId: 'minhson0907_github' , url: 'https://github.com/minhson0907/IBK_HD'
               }
       stage('Run E2E Test and Generate Report') {
               bat label: 'Clean project', script: 'mvn clean'
               bat label: 'run e2e test and generate report', script: 'mvn test verify'
               }

                        }
     }