pipeline {
    agent any
	
    environment {
        GitDirPC = 'C:\\Users\\Juan\\Documents\\GitHub\\ci-cd'
        GitDirTools = "${GitDirPC}\\ci_cd_tools"
		NombreProyecto = ''
    }

    stages {
        stage('Check Ver Compilador 22.6.0') {
            steps {
                script {
                    echo "GitDirPC: ${env.GitDirPC}"
                    echo "GitDirTools: ${env.GitDirTools}"
					echo "NombreProyecto: ${env.NombreProyecto}"
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
