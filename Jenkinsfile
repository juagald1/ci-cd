pipeline {
    agent any
	
    environment {
        GitDirPC = 'C:\\Users\\Juan\\Documents\\GitHub\\ci-cd'
		GitDirDebug = "${GitDirPC}\\Debug"
        GitDirTools = "${GitDirPC}\\ci-cd-tools"
		NombreProyecto = ''
    }

    stages {
        stage('Check Ver Compilador 22.6.0') {
            steps {
                script {
                    bat "cd ${GitDirTools} && .\\${NombreProyecto}.bat"				
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
