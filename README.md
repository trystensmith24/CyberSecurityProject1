# CyberSecurityProject1
Project Repository for Project 1
## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

Images/ProjectNetworkDiagram.png

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the Ansible Playbook file may be used to install only certain pieces of it, such as Filebeat.

  - Ansible/installfilebeat.yml

This document contains the following details:
- Description of the Topologu
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly resillient to overtraffic, in addition to restricting access to the network. Load balancers provide resistance to DDoS attacks, making it much harder for a user to overwhelm the server and take it down by allowing overuse to run through two servers. It also allows the use of health probes to ensure that servers stay up and running. Our Jump Box allows us to connect to any machine in our system, despite this.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the file system and system metrics. Filebeat is deployed on our ELK server to notice any changes to our file system, including downloads and changes to files. Metricbeat is deployed onto our system to measure all our system metrics, such as the CPU usage, to ensure that our system is being properly maintained.

| Name                 | Function       | IP Address | Operating System |
|----------------------|----------------|------------|------------------|
| Jump-Box-Provisioner | Gateway        | 10.1.0.4   | Linux            |
| Elk-VM               | System Monitor | 10.2.0.4   | Linux            |
| Web-1                | DVWA Container | 10.1.0.7   | Linux            |
| Web-2                | DVWA Container | 10.1.0.6   | Linux            |


### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump-Box machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
69.10.126.200 

Machines within the network can only be accessed by the Jump-Box or my own personal machine. They only receive connections from 23.100.20.65(JumpBox) or 69.10.126.200(My Machine).

A summary of the access policies in place can be found in the table below.

| Name                 | Publicly Accessible | Allowed IP Addresses |
|----------------------|---------------------|----------------------|
| Jump-Box-Provisioner | Yes                 | 69.10.126.200        |
| Elk-VM               | Yes                 | 69.10.126.200        |
| Web-1                | No                  | N/A                  |
| Web-2                | No                  | N/A                  |


### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because it ensures all machines are installed exactly the same, and also saves quite a bit of time.

The playbook implements the following tasks:
- _TODO: In 3-5 bullets, explain the steps of the ELK installation play. E.g., install Docker; download image; etc._
- Allow more memory (ELK requires more allocated memory)
- Install necessary packages, docker and python3-pip
- Install Docker python module
- Download the docker container
- Enable docker service on boot

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

Images/docker_ps_output.JPG

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
Web-2: 10.1.0.6
Web-1: 10.1.0.7

We have installed the following Beats on these machines:
Filebeat and Metricbeat

These Beats allow us to collect the following information from each machine:
- _TODO: In 1-2 sentences, explain what kind of data each beat collects, and provide 1 example of what you expect to see. E.g., `Winlogbeat` collects Windows logs, which we use to track user logon events, etc._
Filebeat allows us to monitor the file system for any changes. So say, if a script gets created and edited in Web-1, you would be able to see that occur. Metricbeat monitors the system metrics, including uptime and CPU usage. If an executable takes up a huge chunk of your CPU usage, you will be able to notice it occur. 

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the .deb file from https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.6.1-amd64.deb to  /etc/ansible.
- Update the config file to include the IP address of your ELK server, mine being 10.2.0.4.
- Run the playbook, and navigate to http://[your.VM.IP]:5601/app/kibana to check that the installation worked as expected.
