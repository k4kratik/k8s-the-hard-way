## Module-1 Compute

Here we will create 7 EC2 Instances, I know that's a lot to start with. But Trust me I will try to make it as cost-effective as possible. Also It will be ideal and can be used to deploy any actual infrastructure. We can learn here how to create multiple controller instances, How to load balance them, etc.

**Resources List:**
- 3 Instances for K8s Control Plane
- 3 Instances as K8s Workers
- 1 Bastion Host to access and update our cluster as it will be in a private subnet
- 1 Load Balancer
- Others which does not incur as any cost like Target Group, Security Groups, etc.

I am using `count` in Resources like EC2s so I don't have to repeat my code.

For Now I am keeping the SG Ingress rule minimal, down the road, I will add more ingress rules as required.