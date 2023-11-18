pipeline {
    agent any

    stages {
        stage('Static Code Analysis') {
            steps {
                script {
                    def toolDir = 'C:\\Users\\Usuario\\Documents\\GitHub\\ci-cd\\ci-cd-tools'
                    def topDir = 'C:\\Users\\Usuario\\Documents\\GitHub\\ci-cd\\App'

                    catchError(buildResult: 'UNSTABLE', stageResult: 'FAILURE') {
                        bat "${toolDir}\\static-analysis.bat \"${topDir}\""
                    }
                }
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}
