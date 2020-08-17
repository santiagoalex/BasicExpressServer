
pipeline{
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
 
 }
}