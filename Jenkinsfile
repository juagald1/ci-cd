pipeline {
    agent any
	
    environment {
        GitDirPC = 'C:\\Users\\Usuario\\Documents\\GitHub\\ci-cd'
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
					def VersionCompiladorTIConComillas = bat(script: "call \"${GitDirTools}\\VersionCompiladorTI.bat\" \"${GitDirDebug}\\test_28027.map\" \"${VersionCompiladorTI}\"", returnStatus: false, returnStdout: true).trim()
					
					def VersionCompiladorTISinComillas = VersionCompiladorTIConComillas.trim()					
					
					echo "Con comillas: [${VersionCompiladorTIConComillas}]"
					echo "Sin comillas y sin espacios en blanco: [${VersionCompiladorTISinComillas}]"

					//echo "Longitud de VersionCompiladorTISinComillas: ${VersionCompiladorTISinEspacios.length()}"
					//echo "Longitud de VersionCompiladorTI: ${VersionCompiladorTI.length()}"
					
					//if(VersionCompiladorTISinComillas != VersionCompiladorTI)
					//{
					//	error("La version de compilador no coincide")
					//}else{
					//	echo "${VersionCompiladorTISinComillas}"
					//}					
					
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
