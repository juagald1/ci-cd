pipeline {
    agent any

    stages {
        stage('Check Python Version') {
            steps {
                // Define el nombre del archivo de salida para almacenar la versión de Python
                script {
                    def pythonVersionFile = 'python_version.txt'
                    // Ejecuta el comando 'python --version' y almacena la salida en el archivo
                    bat "python --version > ${pythonVersionFile}"
                }
                // Muestra la versión de Python en la consola
                script {
                    def pythonVersion = readFile('python_version.txt').trim()
                    echo "Versión de Python: ${pythonVersion}"
                }
            }
        }
    }

    post {
        always {
            // Elimina el archivo de salida después de mostrar la versión de Python
            cleanWs()
        }
    }
}
