pipeline {
    agent any

    stages {
        stage('Version Compilador 22.6.0') {
            steps {
                bat script: 'C:\\Users\\Juan\\Documents\\GitHub\\ci-cd\\ci_cd_tools\\buscar_palabra.bat', 
                    label: 'Run script'
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}
