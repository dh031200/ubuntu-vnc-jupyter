# Ubuntu-VNC-Jupyter  
docker image for ubuntu with VNC & JupyterLab  
   
### For Windows wsl2   
Download docker image: [GoogleDrive](https://drive.google.com/file/d/133tIwrNBrx5wNwVRdL5n2RJqEXBeC2Vo/view?usp=share_link)   
```bash
docker load -i ubuntu-vnc-jupyter-wsl2.tar
# REPOSITORY                    TAG               IMAGE ID       CREATED             SIZE
# ubuntu_vnc                    wsl2              472080eae2ad   About an hour ago   2.39GB

# docker run -d -p <VNC_PORT>:5901 -p <JUPYERLAB_PORT>:8888 --name <NAME> --ipc=host --gpus all --privileged -v <DIR>:<DIR> ubuntu_vnc:wsl2 /start.sh && bash
docker run -d -p 25901:5901 -p 9501:8888 --name dev --ipc=host --gpus all --privileged -v /mnt/d/Dev:/workspace ubuntu_vnc:wsl /start.sh && bash

# CONTAINER ID   IMAGE                                 COMMAND                  CREATED             STATUS                    PORTS                                               NAMES
# 74945c7f67dd   ubuntu_vnc:wsl2                       "/start.sh"              About an hour ago   Up About an hour          0.0.0.0:25901->5901/tcp, 0.0.0.0:9501->8888/tcp     dev
```
  
  
### Connect VNC
> You can use any VNC viewer   
> Use RealVNC for following example : https://www.realvnc.com/en/connect/download/viewer/   
>
> VNC Server   
> * localhost:25901   
>  
> Password   
> * dh3051   
>    
> ### Process
> ![VNC_EXAMPLE_1](/assets/vnc-1.png) |![VNC_EXAMPLE_2](/assets/vnc-2.png) |![VNC_EXAMPLE_3](/assets/vnc-3.png)
> -- | -- |  -- |  
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
Launcher -> Terminal -> Type 'su' command -> Same as above   
<p align="center">
 <img src = "/assets/jupyter-2_short.png">
</p>
   
--------   
TODO     
- [x] Document --- Keep updating..
- [X] Image for wsl  --- Done!
- [ ] Image for plain ubuntu  --- In progress..
