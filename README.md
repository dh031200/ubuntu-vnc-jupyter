# Ubuntu-VNC-Jupyter  
Ubuntu Docker image with VNC & JupyterLab.   
It's convenient to use as a pre-configured environment.   
Just download image and run it!

### Container Environment   
+ Ubuntu 22.04.1 LTS
+ Xfce 4.16.1
+ TigerVNC 1.12.0
+ Miniconda 23.1.0
+ JupyterLab 3.6.1
+ Simple kernel connector


### Installation
> ```bash
> git clone https://github.com/dh031200/ubuntu-vnc-jupyter.git
> cd ubuntu-vnc-jupyter
> 
> # python3 change_user_name.py --new <username>
> python3 change_user_name.py --new vncbuntu
> 
> ./build_docker.sh
> 
> # Default Jupyterlab port : 3131
> # Default vnc port : 25901
> 
> ./start_docker.sh
> ```
> ![Installation](/assets/installation.png)


### Initialize
Step 1. Change Password
```bash
Current password is   ↓↓↓
Changing password for vncbuntu.
Current password: 
               # Type vncbuntu
New password:
               # Type new password
Retype new password:
               # One more time
passwd: password updated successfully
```
Setp 2. Set VNC Server
```bash
Do you want to set VNCserver [Y/n]
y # Or type `n` for skip
Enter password 2 times to set vnc password.
Then choose 'n' for fully control.

You will require a password to access your desktops.

Password:
      # Type password for connect vnc
Verify:
      # One more time
Would you like to enter a view-only password (y/n)? n
                                                # enter `n` for get control
A view-only password is not used
/usr/bin/xauth:  file /home/vncbuntu/.Xauthority does not exist

New Xtigervnc server '732e9cf19ba0:1 (vncbuntu)' on port 5901 for display :1.
Use xtigervncviewer -SecurityTypes VncAuth,TLSVnc -passwd /home/vncbuntu/.vnc/passwd 732e9cf19ba0:1 to connect to the VNC server.
```
Step 3. Install miniconda
```bash
Do you want to install miniconda [Y/n]
y # Or type `n` for skip

Welcome to Miniconda3 py310_23.1.0-1
...
...
Do you accept the license terms? [yes|no]
[no] >>> yes
...
...
Miniconda3 will now be installed into this location:
/home/vncbuntu/miniconda3

  - Press ENTER to confirm the location
  - Press CTRL-C to abort the installation
  - Or specify a different location below

[/home/vncbuntu/miniconda3] >>>
                               # Press enter
...
...
Do you wish the installer to initialize Miniconda3
by running conda init? [yes|no]
[no] >>> yes
    # Enter `yes` for conda init
```
Step 4. Install JupyterLab
```bash
Do you want to install JupyterLab [Y/n]
y # Or type `n` for skip

Collecting jupyterlab
  Downloading jupyterlab-3.6.1-py3-none-any.whl (8.9 MB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 8.9/8.9 MB 35.7 MB/s eta 0:00:00
...
...
Do you want to automatically start jupyterlab when you start the container? [Y/n]
y # Or type `n` for start manually
```
Step 5. Change JupyterLab Password
```bash
# You can see below output.
    To access the server, open this file in a browser:
        file:///home/vncbuntu/.local/share/jupyter/runtime/jpserver-398-open.html
    Or copy and paste one of these URLs:
        http://732e9cf19ba0:8888/lab?token=dd3b4c3873add15b32c1f24e3b11d0b6a983fd263c1fd692
        http://127.0.0.1:8888/lab?token=dd3b4c3873add15b32c1f24e3b11d0b6a983fd263c1fd692
                                        ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑
Please set your Password for jupyterlab using the token above.
```

   
[//]: # (### For Windows wsl2   )

[//]: # (Download docker image: [GoogleDrive]&#40;https://drive.google.com/file/d/133tIwrNBrx5wNwVRdL5n2RJqEXBeC2Vo/view?usp=share_link&#41;   )

[//]: # (```bash)

[//]: # (docker load -i ubuntu-vnc-jupyter-wsl2.tar)

[//]: # (# REPOSITORY                    TAG               IMAGE ID       CREATED             SIZE)

[//]: # (# ubuntu_vnc                    wsl2              472080eae2ad   About an hour ago   2.39GB)

[//]: # ()
[//]: # (# docker run -d -p <VNC_PORT>:5901 -p <JUPYERLAB_PORT>:8888 --name <NAME> --ipc=host --gpus all --privileged -v <DIR>:<DIR> ubuntu_vnc:wsl2 /start.sh && bash)

[//]: # (docker run -d -p 25901:5901 -p 9501:8888 --name dev --ipc=host --gpus all --privileged -v /mnt/d/Dev:/workspace ubuntu_vnc:wsl2 /start.sh && bash)

[//]: # ()
[//]: # (# CONTAINER ID   IMAGE                                 COMMAND                  CREATED             STATUS                    PORTS                                               NAMES)

[//]: # (# 74945c7f67dd   ubuntu_vnc:wsl2                       "/start.sh"              About an hour ago   Up About an hour          0.0.0.0:25901->5901/tcp, 0.0.0.0:9501->8888/tcp     dev)

[//]: # (```)
   
### JupyterLab URL   
> For example: http://localhost:3131/   
> 
> Change password from here   
> ![Jupyer_password](/assets/jupyter_password.png)
   
### Connect VNC
> You can use any VNC viewer   
> Use RealVNC for following example : https://www.realvnc.com/en/connect/download/viewer/   
>
> VNC Server   
> * localhost:25901   
>
>    
> ### Process
> ![VNC_EXAMPLE_1](/assets/vnc-1.png) |![VNC_EXAMPLE_2](/assets/vnc-2.png)
> -- | -- |
>   
> ### VNC Screen
> ![VNC_EXAMPLE_4](/assets/vnc-4.png)

  
### Connect conda environment to jupyter notebook kernel  
  
In terminal  
```sh 
conda create -n test  # Example for new environment

# Output:
#     ...  
#     Proceed ([y]/n)? 
#     ...
#     To activate this environment, use
#
#         $ conda activate test
#
#     To deactivate an active environment, use
#
#         $ conda deactivate

connect_kernel test  # Usage: connect_kernel <Conda env name>

# Output:
#     done
#     Retrieving notices: ...working... done
#     Connect conda environment to jupyter notebook kernel..
#     Installed kernelspec test in /root/.local/share/jupyter/kernels/test
#     ------------------------------------------------------------------------------------
#     [ListKernelSpecs] WARNING | Config option `kernel_spec_manager_class` not recognized by `ListKernelSpecs`.
#     Available kernels:
#       test       /root/.local/share/jupyter/kernels/test
#       python3    /root/miniconda3/envs/test/share/jupyter/kernels/python3

```  

You can see new kernel in JupyterLab   
<p align="center">
 <img src = "/assets/jupyter-3.png">
</p> 


This command is also available in the JupyterLab   
Launcher -> Terminal -> Type 'su <username>' command -> Same as above   
<p align="center">
 <img src = "/assets/jupyter-2_short.png">
</p>
   
--------   
TODO     
- [x] Document --- Keep updating..
- [X] Image for wsl  --- Done!
- [X] Image for plain ubuntu  --- Done!
