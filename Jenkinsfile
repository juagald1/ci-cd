pipeline {
    agent any

    stages {
        stage('Check Python Version') {
            steps {
                script {
                    def pythonExecutable = 'C:\\Users\\Usuario\\AppData\\Local\\Programs\\Python\\Python312\\python.exe'
                    // Ejecuta el comando 'python --version' y muestra la salida en la consola
                    bat script: "${pythonExecutable} --version", returnStatus: true
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
