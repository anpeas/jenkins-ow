pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        //Tag app state
        sh 'docker build -t app:test .'
      }
    }

    stage('Test') {
      steps {
        echo 'TEST'
        /* Run docker app
         --rm: Removes container after stop
         -p 80:80 redirects server port 80 to container port 80*/
        sh 'docker run --rm --name app -id -p 80:80 app:test'
        // Test app is runnning (port 80 is used by app)
        sh 'docker ps'
        sh '/bin/nc -vz localhost 80'
      }
      post{
        always{ //fail or not
          // Otherwise, mulitple tests will not be possible
          sh 'docker container stop app'
        }
      }
    }

    stage('Push Registry'){
      steps {
        //Credentials to access dockerhub
        withCredentials([usernamePassword(credentialsId: 'anpeas_dh', passwordVariable: 'passwd_dh', usernameVariable: 'user_dh')]) {
        /* change tag to new state
           anpeas is the dockerhub username*/
        sh 'docker tag app:test anpeas/app:stable'
        // Dockerhub is default server
        sh 'docker push anpeas/app:stable'
        }

      }
    }
  }
}