# inception
42's common core project; system administration; containerization

Learning materials: 
-virtualization vs containarization: https://www.trianz.com/insights/containerization-vs-virtualization#:~:text=Containerization%20is%20a%20form%20of,isolate%20processes%20from%20one%20another.

-Docker : https://docker-curriculum.com 

### Virtualization
Is a technology that lets you create usefule IT services using resources that are linked to hardware. It allows you to use the physical machine by distriburing it's capabilities.

#### Types of virtualization
<ul>
    <li>Data Virtualization:</li>
    <p>
        Consolidate data spread into a single source. The logical data management allows establishing a single data-access and real-time access to data stored across multiple heterogenous data sources.
        Examples of data virtualization tools:
        <a href="https://www.denodo.com/en/solutions/overview">Denodo platform</a>
        <a href="https://www.sap.com/products/technology-platform/hana.html">SAP Hana</a>
        <img src ="./imgs/data_virt.png">
    </p>
    <li>Desktop virtualization</li>
    <p>
        Different from OS virtualization, Desktop virtualization allows a central administrator to deploy simulated desktop environments to hundreds of physical machines at once. Unlike traditional desktopn evironment that are physically installed and configured, desktop virtualization allows admins to perform mass configurations on all machines.
        Programs like Virtual box, Qemu or VMware... could fall under the Desktop virtualization category.
        <img src="./imgs/desktop_virt.png">
    </p>
    <li>Server virtualization</li>
    <p>
        Server virtualization is dividing physical servers into isolated virtual ones, allowing each virtual server to host it's own OS.
        <img src="./imgs/server_virt.png">
    </p>
    <li>Operating system virtualization</li>
    <p>
        OS virtualization happens at the Kernel. It's a way to run Linux and Windows environments side by side. The Kernel enables the existence of various isolated user-space instances.
        <img src="./imgs/os_virt.png">
    </p>
    <li>Network functions virtulization</li>
    <p>
        Network functions virtualization separates the network's key functions (like directory services, file sharing, and IP configuration) so they can be distributed among environments.
        <img src="./imgs/network_virt.png">
    </p>
</ul>

#### How does Virtualization work?
Software called Hypervisors separate the physical resources from the virtual environment.

#### Hypervisors
<ul>
    <li> Introduction </li>
        <p>
        A Hypervisor is a type of software, that creates and runs virtual machines. 
        The Hypervisor presents the guest OS with a virtual operating platform and manages the execution of the guest operating systems.
        </p>
    <li> Hypervisors types </li>
    <img src="./imgs/hypervisor.png">
    <ol>
        <li>Type1: native / bare-metal hypervisor</li>
        <p>
            This type of hypervisors runs directly on the physical hardware, without the need for a host os. It interacts directly with the hardware and constrols the allocation of physical resources to VMs. 
        </p>
        <li>Type2: Hosted Hypervisors</li>
        <p>
            This type of hypervisors runs on a conventional OS just like other computer programs. It relies on the host OS to manage hardware resources and provides virtualization layer on top of it. (Virtual box, VMware...)
        </p>
    </ol>
</ul>

#### KVM (Kernel-based Virtual machine)
<p>
    KVM is an open source virtualization technology built into Linux. KVM lets you turn Linux into a hypervisor that allows a host machine to run multiple Virtual environments.
    KVM converts Linux into a type1 hypervisor. Since it's already built inside the Linux Kernel, it has by default all the Kernel modules and components it needs.
    There are other tools similar to KVM but irrelevant compared to KVM (Like MS Hyper-V, but who cares about Windows!?)  
</p>
<img src="./imgs/KVM.png">


### Containerization
Containerization is the packaging of software code with just the OS Libraries and dependencies required to run the code to create a singel lightweight executable.<br>

We know that virtualization relies on the hypervisor to run virtual environment on another environment built on the physical envronment. Containerization in the other hand, operate on a higher level in the system stack, and is based on the main system's kernel to operate.<br>

Before jumping to containerization at runtime, we need to introduce 2 of the most important feature in Linux systems which containerization is based on: Namespaces and Cgroups. These features allow process isolation:

#### Namespaces
Namespacing is a feature of the Linux Kernel, that provides process isolation, by creating different namespaces for various system resources. <br>
Namespacing can easily done by running the unshare command, e.g:
```
$ sudo unshare --fork --pid --mount-proc sh
```
There are several types of namespaces that container runtime uses:
<ul>
    <li>PID namespaces: processes inside a container has their own process ID namespaces, meaning that the processes ran inside the container, are isolated from other processes run in the system outside.</li>
    <li>Network namespaces: Containers have their own Network interfaces, IP addresses and routing tables. Which allows networked applications to run independently.</li>
    <li>Mount namespaces: This allows containers to mount their own isolated filesystems. And changes made to these filesysems will not affect the host system.</li>
    <li>UTS namespaces: UTS(Unix Timesharing System) namespace is a form of namespacing that isolates the hostname and NIS(Network information service) domain name that are associated with a container. <br>
    If you want to know more about: <a href="https://www.ionos.com/digitalguide/hosting/technical-matters/hostname/">Hostname</a>, <a href="https://en.wikipedia.org/wiki/Network_Information_Service">NIS</a>, <a href="https://en.wikipedia.org/wiki/Linux_namespaces">Namespacing</a>.
    </li>
</ul> 

#### CGroups
CGroups (Control Groups), are a Linux Kernel feature that allows the allocation and management of system resources. It's used to provide the necessary system resources. Because by default in the user land, the kernel provides a certain amount of resources to processes ran.<br>
Example of a cgroup that limits memory: <br>
```
$ sudo cgcreate -a redaoui -g memory:cgExample
```
#### seccomp-bpf
In addition to Namespaces and CGroups, it's only fair to know how to restrict system-calls. 
$ sudo cgcreate -a bork -g memory:mycoolgrou
Points to discuss:
<ul>
    <li>Kernel-level isolation: </li>
    <li>Container images</li>
    <li>Container runtimes</li>
    <li>Security</li>
</ul>


