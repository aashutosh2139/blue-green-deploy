pipeline {
    agent any
    parameters {
        choice(name: 'DEPLOY_COLOR', choices: ['blue', 'green'], description: 'Choose deployment color')
    }
    stages {
        stage('Deploy') {
            steps {
                checkout scm
                sh "kubectl apply -f manifests/${params.DEPLOY_COLOR}/deployment.yaml"
            }
        }
        stage('Switch Traffic') {
            steps {
                sh "bash scripts/switch_traffic.sh ${params.DEPLOY_COLOR}"
            }
        }
    }
}
