pipeline {
    agent any
	
    environment {
        GitDirPC = 'C:\\Users\\Usuario\\Documents\\GitHub\\ci-cd'		//Completar por usuario ubicación del repositorio
        GitDirDebug = "${GitDirPC}\\Debug"
        GitDirTools = "${GitDirPC}\\ci_cd_tools"
		
		DirWorkspace = 'C:\\Users\\Usuario\\workspace'
		
		NombreProyecto = 'test_28027'
		NombreProyecto1 = 'test_28027'
		VersionCompiladorTI = 'v22.6.0'									//Completar por usuario version de compilador TI del proyecto
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
					// 1 Se completa la ruta de tools con el archivo .bat 
					// 2 Se añade como primer argumento de entrada la ruta con el archivo .map
					// 3 Se añade como segundo argumento de entrada la version de compilador TI a buscar en archivo .map
					// 4 Si lo encuentra correctamente ejecuta echo, sino existe, el archivo .bat devuelve log con error
					bat(script: "call \"${GitDirTools}\\VersionCompiladorTI.bat\" \"${GitDirDebug}\\test_28027.map\" \"${VersionCompiladorTI}\"", returnStatus: false, returnStdout: true).trim()
					echo "Version Compilador TI \"${VersionCompiladorTI}\" OK"								
                }
            }
        }
		stage('Compila Proyecto') {
            steps {
                script {
					// Change to the tools directory
                    bat "cd \"${GitDirTools}\""

                    // Execute the batch script without arguments
                    //bat "call CompilarProyecto.bat"

                    // Alternatively, if you want to capture the exit code
                    def result = bat(script: "call CompilarProyecto.bat", returnStatus: true)

                    if (result == 0) {
                        echo "Batch script executed successfully."
                    } else {
                        error "Error: Batch script execution failed with exit code ${result}."
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
