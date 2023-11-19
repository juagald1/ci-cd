pipeline {
    agent any
	
    environment {
        GitDirPC = 'C:\\Users\\Juan\\Documents\\GitHub\\ci-cd'
        GitDirDebug = "${GitDirPC}\\Debug"
        GitDirTools = "${GitDirPC}\\ci_cd_tools"
		NombreProyecto = ''

    }

    stages {
        stage('Nombre Proyecto CCS') {
            steps {
                script {
                    // 1 Se completa la ruta de tools con el archivo .bat 
					// 2 Se añade como argumento de entrada al archivo .bat, la ruta donde debe buscar el archivo. out
					// 3 Se guarda el nombre del proyecto en variable entorno
					NombreProyecto = bat(script: "call \"${GitDirTools}\\NombreProyecto.bat\" \"${GitDirDebug}\"", returnStatus: false, returnStdout: true).trim()
                    echo "${NombreProyecto}"
                }
            }
        }
		stage('Version Compilador TI') {
            steps {
                script {
					error("OLA")
                    //echo "${NombreProyecto}"
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
