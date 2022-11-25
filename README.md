# Ubuntu-VNC-Jupyter  
docker image for ubuntu with VNC & JupyterLab  

### For Windows wsl2
```bash
# docker run -d -p <VNC_PORT>:5901 -p <JUPYERLAB_PORT>:8888 --name <NAME> --ipc=host --gpus all --privileged -v <DIR>:<DIR> ubuntu_vnc:wsl2 /start.sh && bash
docker run -d -p 25901:5901 -p 9501:8888 --name dev --ipc=host --gpus all --privileged -v /mnt/d/Dev:/workspace ubuntu_vnc:wsl /start.sh && bash
```
  
  
### Connect VNC
You can use any VNC viewer  
Use RealVNC for following example : https://www.realvnc.com/en/connect/download/viewer/

  
  
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
This command is also available in the JupyterLab
Launcher -> Terminal -> Type 'su' command -> Same as above
