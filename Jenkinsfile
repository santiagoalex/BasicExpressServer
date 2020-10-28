
pipeline{

 environment {
        registry = "santiagoalex/basic-express-server"
        registryCredential = ‘images-test’
       }
 agent {
        label 'DojoSS'
       }
 stages{
       stage('Checkout-git'){
              steps {
               git poll: true, url: 'https://github.com/santiagoalex/BasicExpressServer.git'    
              }
       }
       
       stage('InstallRequirements'){
              steps {
                     sh '''
                           bash -c "npm i"
                     '''
              }
       }
       stage('TestApp'){
              steps {
                     sh '''
                           bash -c "npm test"
                     '''  
              }
       }
       stage('RunApp'){
              steps {
                     sh '''
                           bash -c "npm start & ls"
                     '''
              }
       }

       stage('SonarQube analysis') {
              def scannerHome = tool 'SonarScanner 4.0';
              withSonarQubeEnv() { // If you have configured more than one global server connection, you can specify its name
              sh "${scannerHome}/bin/sonar-scanner"
              }
       }
       stage('Building image') {
              steps{
               script {
                  dockerImage = docker.build registry + ":$BUILD_NUMBER"
               }
              }
       }
       stage('Deploy Image') {
              steps{
               script {
                  docker.withRegistry( '', registryCredential ) {
                    dockerImage.push()
                  }
               }
              }
       }
       stage('Remove Unused docker image') {
              steps{
               sh "docker rmi $registry:$BUILD_NUMBER"
              }
       }
 
 }
}