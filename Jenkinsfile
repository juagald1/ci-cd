pipeline {
    agent any

    stages {
        stage('Version Compilador 22.6.0') {
            steps {
                script {
                    def toolDir = 'C:\\Users\\Juan\\Documents\\GitHub\\ci-cd\\ci_cd_tools'

                    bat label: 'Run buscar_palabra.bat', script: "${toolDir}\\buscar_palabra.bat \"TMS\""
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
