pipeline {
    agent any
	
    environment {
        GitDirPC = 'C:\\Users\\Juan\\Documents\\GitHub\\ci-cd'
		GitDirDebug = "${GitDirPC}\\Debug"
        GitDirTools = "${GitDirPC}\\ci_cd_tools\\NombreProyecto.bat"
		NombreProyecto = ''
    }

    stages {
        stage('Check Ver Compilador 22.6.0') {
            steps {
                script {
					bat "call ${GitDirTools} ${GitDirDebug}"                
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}
