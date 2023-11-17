pipeline {
    agent any

    stages {
        stage('Static Code Analysis') {
            steps {
                script {
                    def executableLocation = 'C:\\Program Files\\Cppcheck\\cppcheck'  // Reemplaza con la ruta real al ejecutable
                    def topDir = "${WORKSPACE}\\App"  // Reemplaza con la ruta real al directorio de nivel superior

                    def cmd = "\"${executableLocation}\""
                    def opt = "--error-exitcode=1 --inline-suppr"

                    bat "${cmd} ${opt} \"${topDir}\""
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
