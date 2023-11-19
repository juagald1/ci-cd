pipeline {
    agent any
	
    environment {
        GitDirPC = 'C:\\Users\\Juan\\Documents\\GitHub\\ci-cd'
        GitDirDebug = "${GitDirPC}\\Debug"
        GitDirTools = "${GitDirPC}\\ci_cd_tools"
        NombreProyecto = 'NombreProyecto.bat'
    }

    stages {
        stage('Check Ver Compilador 22.6.0') {
            steps {
                script {
                    // Ejecutar el archivo .bat desde el directorio de herramientas con el directorio de depuración como argumento
                    bat "call \"${GitDirTools}\\${NombreProyecto}\" \"${GitDirDebug}\""
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
