pipeline {
  agent any
    stages {
      stage ('Build') {
        steps {
          git branch: 'main', changelog: false, url: 'https://github.com/hanjustin/Poll-Web.git'
          sh 'pip3 install -r requirements.txt'
        }
      }
      stage ('Test') {
        steps {
          sh 'python3 manage.py test .'
          echo "Test Phase"
        }
    }
  }
}
