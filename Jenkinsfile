pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Puedes personalizar esta sección para tu repositorio y rama específicos
                checkout scm
            }
        }

        stage('Check Python Version') {
            steps {
                script {
                    // Ejecutar el comando para obtener la versión de Python
                    def pythonVersion = sh(script: 'python --version', returnStdout: true).trim()
                    
                    // Imprimir la versión de Python
                    echo "La versión de Python es: ${pythonVersion}"

                    // Puedes agregar más lógica aquí según tus necesidades
                    // Por ejemplo, puedes comparar la versión o realizar acciones basadas en la versión
                }
            }
        }

        // Agrega más etapas según sea necesario
        // ...

    }

    post {
        success {
            echo '¡El flujo de trabajo se ejecutó con éxito!'
        }
        failure {
            echo '¡El flujo de trabajo falló! Revisa los detalles.'
        }
    }
}
