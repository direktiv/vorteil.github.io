---
title: Ansible playbooks
nav_order: 1
has_children: false
layout: default
parent: 3rd Party automation integration
grand_parent: Guides
---

# Ansible Playbooks

The following Ansible playbooks are examples used for AWS, GCP and VMware vCenter/ESXi deployment. All of the playbooks have dependencies which need to be met within the Ansible environment. From a Vorteil perspectie, Ansible only need access to the `vorteil` and for the provisioners to have been configured.

## AWS playbook

```yaml
- name: provision a Vorteil application to AWS Cloud Platform
  hosts: 127.0.0.1
  connection: local

  vars:
    github_repo: "https://github.com/wwonigkeit/github-ansible-scale-demo"
    local_repo: "/home/ubuntu/runners/_work/github-ansible-scale-demo"
    image_name: "nginx-{{ ansible_date_time.date }}"

    aws_region: "ap-southeast-2"
    aws_instance_type: "t2.nano"

  tasks:
          - name: provision image to aws
            command: vcli images provision {{ local_repo }} /home/ubuntu/provisioners/aws.provisioner --name {{ image_name }} --system.hostname nginx-aws --force
            register: ami_info

          - name: extract the AMI id
            set_fact:
                    ami_id: "{{ ami_info.stdout | regex_search(regexp,'\\1') }}"
            vars:
                    regexp: 'Provisioned AMI: (.+)'

          - name: get the instance id for running instances with name = nginx-aws
            ec2_instance_info:
                    region: "{{ aws_region }}"
                    filters:
                            "tag:Name": nginx-aws
            register: running_instance

          - name: stop the old instance if it exsists
            ec2:
                    region: "{{ aws_region }}"
                    instance_ids: "{{ item.instance_id}}"
                    state: absent
            with_items: "{{ running_instance.instances }}"

          - name: provision an AWS instance
            ec2:
                    region: "{{ aws_region }}"
                    instance_type: '{{ aws_instance_type }}'
                    image: '{{ ami_id[0] }}'
                    wait: yes
                    instance_tags:
                            Name: nginx-aws
            register: instance_response

          - name: Allocating elastic IP to instance
            ec2_eip:
                    region: "{{ aws_region }}"
                    device_id: "{{ instance_response.instance_ids[0] }}"
                    ip: 13.237.52.251
                    allow_reassociation: yes

          - name: print provisioned AWS instance info
            debug:
                    msg: "{{ instance_response }}"
```

## GCP playbook

```yaml
- name: provision a Vorteil application to AWS Cloud Platform
  hosts: 127.0.0.1
  connection: local

  vars:
    github_repo: "https://github.com/wwonigkeit/github-ansible-scale-demo"
    local_repo: "/home/ubuntu/runners/_work/github-ansible-scale-demo"
    image_name: "nginx-{{ ansible_date_time.date }}"

    gcp_project: hybrid-robot-160300
    gcp_cred_kind: serviceaccount
    gcp_cred_file: "/home/ubuntu/provisioners/vorteil-demo-gcp.json"
    gcp_zone: "australia-southeast1-b"
    gcp_machine_type: "f1-micro"
    gcp_machine_name: "nginx-gcp"
    gcp_network_name: "default"

  tasks:
          - name: provision image to gcp
            command: vcli images provision {{ local_repo }} /home/ubuntu/provisioners/gcp.provisioner --name {{ image_name }} --system.hostname {{ gcp_machine_name }} --force
            register: gcp_image_info

          - name: get runnning instance info
            gcp_compute_instance_info:
                    zone: "{{ gcp_zone }}"
                    project: "{{ gcp_project }}"
                    auth_kind: "{{ gcp_cred_kind }}"
                    service_account_file: "{{ gcp_cred_file }}"
                    filters:
                            - name = "{{ gcp_machine_name }}"
            register: running_instance_info

          - name: stop running instance
            gcp_compute_instance:
                    state: absent
                    name: "{{ gcp_machine_name }}"
                    zone: "{{ gcp_zone }}"
                    project: "{{ gcp_project }}"
                    auth_kind: "{{ gcp_cred_kind }}"
                    service_account_file: "{{ gcp_cred_file }}"

          - name: create a gcp instance
            gcp_compute_instance:
                    state: present
                    name: "{{ gcp_machine_name }}"
                    machine_type: "{{ gcp_machine_type }}"
                    disks:
                            - auto_delete: true
                              boot: true
                              initialize_params:
                                      source_image: "global/images/{{ image_name }}"
                    network_interfaces:
                            - access_configs:
                                    - name: "External NAT"
                                      type: "ONE_TO_ONE_NAT"
                                      nat_ip:
                                              address: "35.189.8.188"
                    zone: "{{ gcp_zone }}"
                    project: "{{ gcp_project }}"
                    auth_kind: "{{ gcp_cred_kind }}"
                    service_account_file: "{{ gcp_cred_file }}"
                    tags:
                            fingerprint: z4ScqN7mVU4=
                            items:
                                - http-server
                                - https-server
                                - all-out
            register: gcp_instance

          - name: print running info
            debug:
                    msg: "{{ gcp_instance }}"

```

## VMware playbook

```yaml
- name: provision a Vorteil application to VMware
  hosts: 127.0.0.1
  connection: local

  vars:
    github_repo: "https://github.com/wwonigkeit/github-ansible-scale-demo"
    local_repo: "/home/ubuntu/runners/_work/github-ansible-scale-demo/github-ansible-scale-demo"
    image_name: "nginx-{{ ansible_date_time.epoch }}"

    vmw_vsphere_hostname: ""
    vmw_vsphere_username: ""
    vmw_vsphere_password: ""
    vmw_vsphere_datacentre: "ha-datacenter"
    vmw_vsphere_datastore: "datastore1"
    vmw_vsphere_cluster: "esxi."
    vmw_vsphere_folder: "/"
    vmw_machine_name: "nginx-vmw"

    net_ip: "86.109.1.99"
    net_mask: "255.255.255.248"
    net_gateway: "86.109.1.97"

  tasks:
          - name: get all running vms
            vmware_vm_info:
                    validate_certs: no
                    hostname: "{{ vmw_vsphere_hostname }}"
                    username: "{{ vmw_vsphere_username }}"
                    password: "{{ vmw_vsphere_password }}"
            register: vminfo

          - name: create image for vmware
            command: vcli images provision {{ local_repo }} /home/ubuntu/provisioners/vmw-usa.provisioner --name {{ image_name }} --system.hostname {{ vmw_machine_name }} --network[0].gateway {{ net_gateway }} --network[0].ip {{ net_ip }} --network[0].mask {{ net_mask }} --force
            retries: 3
            register: result
            until: result.rc == 0

          - name: remove the old vm
            vmware_guest:
                    validate_certs: no
                    hostname: "{{ vmw_vsphere_hostname }}"
                    username: "{{ vmw_vsphere_username }}"
                    password: "{{ vmw_vsphere_password }}"
                    uuid: "{{ vminfo.virtual_machines[0].uuid }}"
                    state: absent
                    force: yes

          - name: poweron the new vm
            vmware_guest:
                    validate_certs: no
                    hostname: "{{ vmw_vsphere_hostname }}"
                    username: "{{ vmw_vsphere_username }}"
                    password: "{{ vmw_vsphere_password }}"
                    name: "{{ image_name }}"
                    state: poweredon
```
