## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

(Images/ELK_Network_Diagram.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the _____ file may be used to install only certain pieces of it, such as Filebeat.

  - configuration .yml file

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting inbound access to the network.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the file systems through Filebeat, and monitors system metrics through Metricbeat.

The configuration details of each machine may be found below.

| Name                 | Function        | IP Address | Operating System |
|----------------------|-----------------|------------|------------------|
| Jump-Box Provisioner | Gateway         | 10.0.0.1   | Linux 180.4 LTS  |
| Web-1                | DVWA Web Server | 10.0.0.7   | Linux 180.4 LTS  |
| Web-2                | DVWA Web Server | 10.0.0.8   | Linux 180.4 LTS  |
| Web-3                | DVWA Web Server | 10.0.0.9   | Linux 180.4 LTS  |
| ELK Server           | ELK Server      | 10.2.0.4   | Linux 180.4 LTS  |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Load Balancer machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:10.0.0.4:22 & 24.6.52.236:5601

Machines within the network can only be accessed by each other, and the ELK VM can only be accessed from 24.6.52.236 using an SSH connection. 

A summary of the access policies in place can be found in the table below.

| Name                 | Publicly Accessible | Allowed IP Addresses            |
|----------------------|---------------------|---------------------------------|
| Jump-Box Provisioner | No                  | 24.6.52.236:22    10.0.0.4:22   |
| Web-1                | Yes                 | 24.6.52.236:5601    10.0.0.1:22 |
| Web-2                | Yes                 | 24.6.52.236:5601    10.0.0.1:22 |
| Web-3                | Yes                 | 24.6.52.236:5601    10.0.0.1:22 |
| ELK Server           | No                  | 24.6.52.236:22    10.0.0.4:22   |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because this ensures that there is a consistent image installed on the machine with known characteristics.  This provides greater reliability in deployment, and auditing of installation files as the system can be hashed and compared against preivous versions for changes and/or compromise. 


The playbook implements the following tasks:
- Configure a VM on the network to host the ELK server.  This machine should be configured within the appropriate security group with rules that maintain security to the server and allow access to the machines to be monitored. 
- Install Docker, download and configure the container on the VM. 
- Generate the Ansible hosts file and configrue with the host IP addresses allowed to access the docker image 
- Run the Ansible playbook on the new VM

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![TODO: Update the path with the name of your screenshot of docker ps output](Images/docker_ps_output.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- 10.0.0.7    10.0.0.8    10.0.0.9

We have installed the following Beats on these machines:
- Filebeat and Metricbeat are installed on the ELK server monitoring all webservers

These Beats allow us to collect the following information from each machine:
- Filebeat monitors the servers for changes to the files on the machines. 
- Metricbeat monitors the servers for various use metrics from systems and services on the server.  Some of these incldue Apache, HAProxy, MongoDB, MySQL, etc.  We would expect to see metrics and logs pertaining to database changes, frequency of changes, and impacts of these applications and services running and mondifying information on the server. 


### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the playbook .yml file(s) to /etc/ansible.
- Update the hosts file to include the webservers group as hosts
- Run the playbook, and navigate to http://10.0.0.8:5601 to check that the installation worked as expected.
