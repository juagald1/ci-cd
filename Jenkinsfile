pipeline {
    agent any
	
    environment {
        GitDirPC = 'C:\\Users\\Usuario\\Documents\\GitHub\\ci-cd'		//Completar por usuario ubicación del repositorio
        GitDirDebug = "${GitDirPC}\\Debug"
        GitDirTools = "${GitDirPC}\\ci_cd_tools"
		
		DirWorkspace ='C:\\Users\\Usuario\\workspace'
						
		VersionCompiladorTI = 'v22.6.0'									//Completar por usuario version de compilador TI del proyecto
		NombreProyecto = 'test_28027'									//Completar por usuario nombre proyecto
		
    }

    stages {

		stage('Version Compilador TI') {
            steps {
                script {
					// 1 Se completa la ruta de tools con el archivo .bat 
					// 2 Se añade como primer argumento de entrada la ruta con el archivo .map
					// 3 Se añade como segundo argumento de entrada la version de compilador TI a buscar en archivo .map
					// 4 Si lo encuentra correctamente ejecuta echo, sino existe, el archivo .bat devuelve log con error
					bat(script: "call \"${GitDirTools}\\VersionCompiladorTI.bat\" \"${GitDirDebug}\\test_28027.map\" \"${VersionCompiladorTI}\"", returnStatus: false, returnStdout: true).trim()
					echo "Version Compilador TI \"${VersionCompiladorTI}\" OK"								
                }
            }
        }
		stage('TI') {
            steps {
                script {
					def result = bat(script: "call \"${GitDirTools}\\CompilarProyecto.bat\"", returnStatus: true)
					
					if(result == 1)
					{
						error 'Error de compilacion'
					}					
					
					//bat(script: "call \"${GitDirTools}\\CompilarProyecto.bat\" \"${DirWorkspace}\" \"${NombreProyecto}\"", returnStatus: false, returnStdout: true).trim()
					//bat(script: "call \"${GitDirTools}\\CompilarProyecto.bat\" \"${DirWorkspace}\" \"${NombreProyecto}\"", returnStatus: false, returnStdout: true).trim()				
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
