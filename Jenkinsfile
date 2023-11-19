pipeline {
    agent any

    stages {
        stage('Version Compilador 22.6.0') {
            steps {
                script {
                    def toolDir = 'C:\\Users\\Juan\\Documents\\GitHub\\ci-cd\\ci_cd_tools'

                        bat "${toolDir}\\buscar_palabra.bat \"
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

