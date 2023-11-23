pipeline {
    agent any
	
    environment {
        DirGitPC 			= 'C:\\Users\\Usuario\\Documents\\GitHub\\ci-cd'	//Completar, ubicación del proyecto en repositorio 		IMPORTANTE!: Respetar doble \\
		DirWorkspacePC 		= 'C:\\Users\\Usuario\\workspace1'					//Completar, ubicación del workspace					IMPORTANTE!: Respetar doble \\			
		NombreProyecto 		= 'CI_CD_TI'									//Completar, nombre proyecto
		VersionCompiladorTI = 'v21.6.1'										//Completar, version de compilador TI del proyecto
		
        GitDirDebug = "${DirGitPC}\\Debug"
        GitDirTools = "${DirGitPC}\\ci_cd"												
    }

    stages {
		stage('Version Compilador TI') {
            steps {
                script {
					// 1 Se completa la ruta de tools con el archivo .bat 
					// 2 Se añade como primer argumento de entrada la ruta con el archivo .map
					// 3 Se añade como segundo argumento de entrada la version de compilador TI a buscar en archivo .map
					// 4 Si lo encuentra correctamente ejecuta echo, sino existe, el archivo .bat devuelve log con error
					bat(script: "call \"${GitDirTools}\\VersionCompiladorTI.bat\" \"${GitDirDebug}\\${NombreProyecto}.map\" \"${VersionCompiladorTI}\"", returnStatus: false, returnStdout: true).trim()
					echo "Version Compilador TI \"${VersionCompiladorTI}\" OK"								
                }
            }
        }
		stage('Compilacion Proyecto') {
            steps {
                script {
					
					bat(script: "call \"${GitDirTools}\\ProyectoWorkspaceTI.bat\" ${DirWorkspacePC} ${DirGitPC}", returnStatus: true)
					def result = bat(script: "call \"${GitDirTools}\\CompilarProyectoTI.bat\" ${DirWorkspacePC} ${NombreProyecto}", returnStatus: true)
					
					if(result == 0)
					{
						error 'Revisar rutas de proyecto y workspace'
					}
					
					if(result == 1)
					{						
						echo "Compilacion OK"
					}					
					
					if(result == 2)
					{
						error 'Error de compilacion'
					}					
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
