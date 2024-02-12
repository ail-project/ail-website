---
layout: post
title:  "Streamlining AIL & Lacus Deployment: An Automated Installer for LXD"
author: Niclas Dauster
---

![AIL LXD Architecture](https://www.ail-project.org/assets/img/ail-lxd.png)

#  Streamlining AIL & Lacus Deployment: An Automated Installer for LXD

The [AIL framework (Analysis of Information Leak)](https://github.com/ail-project/ail-framework/tree/master) has long been at the forefront of privacy and data leak analysis, providing tools for monitoring, analyzing, and managing leaks of sensitive information. The introduction of a dedicated [LXD](https://canonical.com/lxd) installer marks a significant milestone in making AIL more accessible and easier to deploy, especially in combination with [Lacus](https://github.com/ail-project/lacus), a capturing system using a network telescope. This development is particularly pertinent within the scope of the [MISP-LEA Project](#about-misp-lea), as it underscores a strategic move towards enhancing the accessibility and deployment efficiency of cybersecurity tools for analyzing information leaks. 

## Why LXD?
LXD, a next-generation system container and virtual machine manager, offers an efficient and secure way to run multiple isolated Linux systems (containers) on a single host. Leveraging LXD for AIL and Lacus environments means streamlined deployments and better resource utilization.

## Key Features of the LXD Installer
The LXD installer for AIL and Lacus brings several key benefits to the table:
1. **Simplified Installation Process:** The LXD installer for AIL and Lacus simplifies the setup process, making it accessible even to those with minimal experience in container management.

2. **Resource Efficiency:** LXD's lightweight nature means that AIL and Lacus can run on a wide range of hardware setups without significant resource overhead, making it ideal for both small-scale investigations and large-scale deployments.

## Getting Started
The LXD installer for AIL and Lacus is designed to be user-friendly and straightforward. Here's a high-level overview of the installation process. For detailed instructions, refer to the [LXD installer README](https://github.com/ail-project/ail-framework/blob/master/other_installers/LXD/README.md).
1. **Prerequisites:** Ensure that LXD is installed on the host system. If not, follow the [official LXD installation guide](https://documentation.ubuntu.com/lxd/en/latest/tutorial/first_steps/). Additionally, ensure that jq is installed on the host system.
2. **Clone the Repository:** Clone the AIL framework repository to the host system.
3. **Run the Installer:** Navigate to the `other_installers/LXD` directory within the AIL framework repository and run the `INSTALL.sh` script. Running the script in interactive mode will guide you through the installation process, prompting you for necessary information along the way:
    ```bash
    bash INSTALL.sh --interactive
    ```

The installation process is comprehensive, as it involves a complete setup of AIL within the container, which can be time-consuming. To expedite this process, you have the option to download pre-built LXD images from the [AIL images website](https://images.ail-project.org/). Utilizing these images can significantly reduce installation time by following these steps:

1. Import images to LXD
    ```bash
    lxc image import <path_to_image> --alias <image_alias>
    ```
2. Launch containers using the imported images
    ```bash
    lxc launch <image_alias> <container_name>
    ```
3. Get default credentials for AIL 
    ```bash
    lxc exec <container_name> --  bash -c "grep '^password=' /home/ail/ail-framework/DEFAULT_PASSWORD | cut -d'=' -f2"
    ```

## Configuration
Once the installation concludes, the AIL and Lacus containers will be operational and poised for configuration. Verify their status by execute `lxc list`. To integrate AIL with Lacus for crawling tasks, access the AIL web interface on `https://<ip_of_ail_container>:7000`, navigate to `Crawlers -> Settings`, and specify the Lacus Server URL with the IP address of your Lacus container. Here, you also have the opportunity to adjust the number of crawlers to deploy according to your needs. Upon successful configuration, initiating a crawler test should yield a confirmation message, "It works!".

![AIL Crawler Settings](https://www.ail-project.org/assets/img/ail-settings.png)

## Monitoring and Management
The LXD CLI allows for comprehensive monitoring and management of your containers. Check their status, access shell environments, and adjust resources as needed. For detailed management techniques, the [official LXD documentation](https://documentation.ubuntu.com/lxd/en/latest/) is an excellent resource.

Within the container, AIL operates multiple services that can be actively monitored and managed through screen sessions. To view all active screen sessions associated with AIL, execute the following command:
```bash
lxc exec <ail_container_name> -- sudo -u ail -- screen -ls
```
To engage with a specific session, you can connect by running:
```bash
lxc exec <ail_container_name> -- sudo -u ail -- screen -r <session_id>
```
This approach allows for real-time interaction with AIL's various services, facilitating immediate adjustments or monitoring as needed.

## Use Cases and Applications
The development of the LXD installer for AIL, particularly under the [MISP-LEA](#about-misp-lea) project, was primarily aimed at providing Law Enforcement Agencies with a streamlined and secure method to deploy AIL. Deploying AIL and Lacus within LXD containers brings significant benefits to cybersecurity operations, highlighted by several key applications and use cases:

1. **Environment Replication for Incident Response Training**: LXD's cloning features enable precise replication of operational environments for incident response drills. This hands-on training is crucial for teams to develop effective response strategies, enhancing their preparedness for real-world incidents.

2. **Scalable Deployment for Data Analysis**: LXD's lightweight containers allow for scalable deployment, enabling comprehensive monitoring and analysis across extensive data sets. This scalability is essential for organizations needing real-time analysis of multiple data sources, ensuring thorough coverage without extensive resource requirements.

3. **Rapid Prototyping and Testing**: The efficiency of LXD containers supports quick deployment and testing of new security configurations and tools. This rapid prototyping capability is invaluable for staying ahead of emerging threats, allowing for the development and testing of new security measures in a secure environment.


## Conclusion
The new LXD installer significantly lowers the barrier to entry for deploying the AIL framework and Lacus, making advanced leak analysis tools accessible to a broader audience. By leveraging the strengths of LXD, this installer ensures a secure, efficient, and user-friendly deployment process.

This overview provides a glimpse into the benefits and capabilities of the new LXD installer for AIL and Lacus. For those interested in diving deeper, visiting the AIL project's [GitHub repository](https://github.com/ail-project/ail-framework) is the best way to start exploring the potential of this powerful tool.

## About MISP-LEA

[MISP-LEA](https://www.misp-lea.org/), a collaborative endeavor between [Shadowserver](https://www.shadowserver.org/) and [CIRCL](https://www.circl.lu/), is a 24-month initiative funded by the European Union. The project’s central aim is to establish operational and enduring [MISP](https://www.misp-project.org/) and AIL instances dedicated specifically to law enforcement agencies.