#!/bin/bash
sudo yum update -y

yum install -y awslogs
 Configure CloudWatch Logs agent
cat <<EOF > /etc/awslogs/awslogs.conf
[general]
state_file = /var/lib/awslogs/agent-state

[/var/log/messages]
log_group_name = ${log_group_name}
log_stream_name = {instance_id}/messages
file = /var/log/messages

[/var/log/secure]
log_group_name = ${log_group_name}
log_stream_name = {instance_id}/secure
file = /var/log/secure
EOF

# Start CloudWatch Logs agent
service awslogs start
chkconfig awslogs on

sudo yum install docker -y
sudo service docker start
sudo systemctl enable docker
sudo usermod -a -G docker ec2-user
aws ecr get-login-password --region ${region}  | docker login --username AWS --password-stdin ${ecr_url}
docker run --restart always -e APPLICATION_LOAD_BALANCER=${application_load_balancer} -p 3000:3000 -d ${ecr_url}/${ecr_repo_name}:latest