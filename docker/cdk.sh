#!/bin/bash

if [ -z "$1" ]
then
        echo "ERROR!!  Usage: disconnect_kernel <Conda env name>"
        exit -1
else
        echo "ENV: $1"
fi

source activate $1
if [ -d "miniconda3" ]
then
    ~/miniconda3/bin/python -m jupyter kernelspec uninstall -y $1
else
    ~/.local/bin/jupyter kernelspec uninstall -y $1
fi
conda deactivate
echo "------------------------------------------------------------------------------------"

source activate $1
if [ -d "miniconda3" ]
then
    ~/miniconda3/bin/python -m jupyter kernelspec list
else
    ~/.local/bin/jupyter kernelspec list
fi