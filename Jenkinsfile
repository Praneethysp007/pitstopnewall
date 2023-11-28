pipeline {
    agent{
        label 'bhavana'
    }
    // triggers{
    //     pollSCM('* * * * *')
    // }
    stages{
        stage('vcs') {
           steps{
               git url: 'https://github.com/Praneethysp007/bhavapitstop.git',
                   branch: 'main'
            }
        }
        stage('build') {
            steps{
                sh 'dotnet build src/pitstop.sln'


                // rtUpload(
                //     serverId: 'myinstance',
                //     spec: """{
                //         "files": [
                //             {
                //                 "pattern": "**/*.dll",
                //                 "target": "pitstop-generic-local/pitstop-generic-local/"
                //             }
                //         ]
                //     }""" 

                // )

            }
        }
        
        // stage('SonarQube analysis') {
        //     steps {
        //         withSonarQubeEnv('sonarcube') {
        //         sh 'dotnet build src/pitstop.sln sonar:sonar -Dsonar.organization=myorganisationysp -Dsonar.projectKey=myorganisationysp_pitstop'
        //         }
        //     }    
        // }
         stage(dockerbuildimage){
            steps{
                sh 'docker compose up'       
            }
        }
        // stage(pushimage){
        //     steps{
        //         script{
        //             withCredentials([string(credentialsId: 'dockerpass', variable: 'mypasswd')]) {

        //             sh 'docker login -u praneethysp007 -p ${mypasswd}'

        //             sh 'imagepush.sh'
         
        //             }
        //         }
        //     }   
            
        // }
        // stage(eksmoduleterraform){
        //    steps{
        //     sh 'terraform init'

        //     sh 'terraform apply -auto-approve'

        //     sh 'aws eks update-kubeconfig --region us-east-2 --name pitstop'
        //    }
        // }
        // stage(deploy){
        //     steps{
        //         sh 'cd pitstopproject'

        //         sh 'kubectl apply -f .'
        //     }  
        // }
    }
}