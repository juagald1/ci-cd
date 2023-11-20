pipeline {
    agent any
	
    environment {
        GitDirPC = 'C:\\Users\\Usuario\\Documentos\\GitHub\\ci-cd'
        GitDirDebug = "${GitDirPC}\\Debug"
        GitDirTools = "${GitDirPC}\\ci_cd_tools"
		NombreProyecto = ''
		VersionCompiladorTI = 'v22.6.0'
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
                    bat "call \"${GitDirTools}\\VersionCompiladorTI.bat\" ${NombreProyecto}.map \"${VersionCompiladorTI}\""
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
