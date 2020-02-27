node() {
        stage("POLL SCM") {
                git credentialsId: 'gitlab', url: 'https://github.com/goyalvickey78/CF_ECS_FARGATE_Jenkins.git'
        }
	stage("CF Lintingi and Json Validation"){
	    withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'ACCESS_ID', credentialsId: 'ECS_FARGATE', secretKeyVariable: 'ACCESS_KEY']]) {
    		docker.withTool('myDocker') {
		    //Buidling a docker images based on the dockerfile
    		    sh "docker build -t awscli ."
                    //Validating the CF template with cfn-lint and container will be created & validate
    		    sh "docker run --rm awscli cfn-lint New_ECS_Fargate_Para.yml"
                    //Validating the Parameter JSON file with Pyton json.tool module
    		    sh "python -m json.tool parameters.json"
    		    sh "docker rmi awscli"
    		}
	    }
	}
       stage("ECS Fargate CF Trigger") {
	    // Using the AWS credentials which are stored in Jenkins
            withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'ACCESS_ID', credentialsId: 'ECS_FARGATE', secretKeyVariable: 'ACCESS_KEY']]) {
                //Using Docker tool configured in Jenkins
               	docker.withTool('myDocker') {
                	sh "docker build -t awscli ."
                        //Cloud Formation ECS Fargate Stack will be triggered with AWS CLI
                    	sh "docker run -e \"AWS_ACCESS_KEY_ID=${ACCESS_ID}\" -e \"AWS_SECRET_ACCESS_KEY=${ACCESS_KEY}\" --rm awscli aws cloudformation create-stack --stack-name jfrogexample1 --template-body file://New_ECS_Fargate_Para.yml --parameters file://parameters.json"
                        //It will show all EC2 instsnces in AWS account
                        sh "docker run -e \"AWS_ACCESS_KEY_ID=${ACCESS_ID}\" -e \"AWS_SECRET_ACCESS_KEY=${ACCESS_KEY}\" --rm awscli aws ec2 describe-instances --output table"
                        sh "docker rmi awscli"
               }
            }
        }
    }
