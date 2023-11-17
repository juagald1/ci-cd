pipeline {
    agent any

    stages {
        stage('Check Python Version') {
            steps {
                script {
                    def pythonExecutable = 'C:\\Users\\Usuario\\AppData\\Local\\Programs\\Python\\Python312\\python.exe'
                    def pythonVersionFile = 'python_version.txt'
                    bat "${pythonExecutable} --version > ${pythonVersionFile}"
                }
                script {
                    def pythonVersion = readFile('python_version.txt').trim()
                    echo "Versión de Python: ${pythonVersion}"
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
