pipeline {
    agent any

    stages {
        stage('Ejecutar script de búsqueda') {
            steps {
                bat script: 'C:\\Users\\Juan\\Documents\\GitHub\\ci-cd\\ci_cd_tools\\buscar_palabra.bat', 
                    label: 'Run script'
            }
        }
    }

    post {
        always {
            // Puedes agregar acciones adicionales que se ejecutarán siempre, independientemente del resultado.
        }
    }
}
