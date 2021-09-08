# counter_new
1.	Connect to aws
2.	Crate ec2 machine (t2_micro)

3.	Play with flask – set to work on port 80 – mistake , since we can achieve this by port forwarding on the deployed container / load balancer later in the exercise

4.	Prepare container for flask app (minimal linux and python - python:3.8-slim-buster) 
a.	App.py
b.	Dockerfile
c.	docker build --tag counter_new .
d.	docker run  --publish 5000:5000 --name counter_new_process counter_new 
running without –d shows output on the screen
e.	debug – connect to the contained process:
docker exec -it counter_new_process /bin/bas

5.	Push to docker hub, and good tagging convension:

# build with significant tag
docker build --rm -f Dockerfile -t arielao/counter_new:$(git show -s --format=%ct-%h) -t arielao/counter_new:latest .

# push all tags – use latest in your code
   	docker push arielao/counter_new --all-tags

	#run docker:
docker run -d --publish 5000:5000 --name counter_new_process counter_new
replace counter_new with arielao/counter_new if you want to run from repo (as container will)

(To run with docker-compose
docker-compose -f docker-compose.dev.yml up –build)

6.	Install Terraform
(Terraform, awscli, main.tf, create eks)
https://learn.hashicorp.com/tutorials/terraform/install-cli?in=terraform/aws-get-started install terraform /
windows

https://learn.hashicorp.com/tutorials/terraform/aws-build
In this tutorial, you will provision an EC2 instance on Amazon Web Services (AWS). EC2 instances are virtual machines running on AWS, and a common component of many infrastructure projects.

connect to aws account
use existing keypair

https://learn.hashicorp.com/tutorials/terraform/eks
https://learnk8s.io/terraform-eks
https://learnk8s.io/terraform-eks#you-can-provision-an-eks-cluster-with-terraform-too

7-9 covered in
https://docs.docker.com/language/python/build-images/
https://docs.docker.com/language/python/run-containers/
https://docs.docker.com/language/python/develop/
https://docs.docker.com/language/python/configure-ci-cd/


7.	Create container from #5 deployment.yaml 
C:\Users\ariela\counter_new>kubectl apply -f .\deployment.yaml

8.	Create Load Balancer for container in #7 service-loadbalancer.yaml
C:\Users\ariela\counter_new>kubectl apply -f .\service-loadbalancer.yaml
(port forwarding is done in above yaml and achieves the same as:
C:\Users\ariela\counter_new>kubectl port-forward  hello-kubernetes-59fc9f9c46-jnfm9 80:5000

To replace the old with new deployment – (in CD process)

C:\Users\ariela\learn-terraform-provision-eks-cluster>kubectl rollout restart deploy hello-kubernetes
deployment.apps/hello-kubernetes restarted

	Help on CD process
	How to deploy from docker hub to aws esk:
https://github.com/marketplace/actions/kubectl-aws-eks

9.	CI/CD process as describes in:
https://docs.docker.com/language/python/configure-ci-cd/




