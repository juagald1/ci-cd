pipeline {
    agent any
	
    environment {
        GitDirPC = 'C:\\Users\\Juan\\Documents\\GitHub\\ci-cd'
        GitDirDebug = "${GitDirPC}\\Debug"
        GitDirTools = "${GitDirPC}\\ci_cd_tools"
    }

    stages {
        stage('Nombre Proyecto') {
            steps {
                script {
                    // Se completa la ruta de tools con el archivo .bat y se añade como argumento de enrtada al .bat, la ruta donde debe buscar el archivo. out
					bat "call \"${GitDirTools}\\NombreProyecto.bat\" \"${GitDirDebug}\""
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
