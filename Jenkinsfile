pipeline {
  agent {
    docker {
      image 'jfernancordova/nsync-digital:1.0.0'
      args '-p 80:80'
    }

  }
  stages {
    stage('Build') {
      steps {
        sh 'echo build'
      }
    }
    stage('Test') {
      environment {
        CI = 'true'
      }
      steps {
        sh 'echo test'
      }
    }
    stage('Deliver') {
      steps {
        sh './jenkins/scripts/kill.sh'
      }
    }
  }
}