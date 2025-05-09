# Blue-Green Deployment on EKS with Jenkins

## How it Works

- EKS runs Jenkins with EBS volume (via PVC)
- You deploy a blue or green version of the app
- Traffic is switched via Service selector
- Controlled from Jenkins pipeline

## Usage

1. Push this code to GitHub.
2. In Jenkins UI (http://aae0a61743d7944a8ae048a346765c6e-1859341342.us-east-1.elb.amazonaws.com:8080), create a pipeline job:
   - Use "Pipeline from SCM"
   - Repo URL: your GitHub URL
   - Jenkinsfile path: Jenkinsfile
3. Run the job and pick blue or green.

To unlock Jenkins:
kubectl exec -it -n jenkins deployment/jenkins -- cat /var/jenkins_home/secrets/initialAdminPassword
