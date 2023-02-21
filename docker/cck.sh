#!/bin/bash

if [ -z "$1" ]
then
	echo "ERROR!!  Usage: connect_kernel <Conda env name>"
	exit -1
else
	echo "ENV: $1"
fi

source activate $1
conda install -y nb_conda_kernels ipykernel
echo "Connect conda environment to jupyter notebook kernel.."

if [ -d "miniconda3" ]
then
    ~/miniconda3/bin/python -m ipykernel install --user --name $1 --display-name "$1"
else
    ~/.local/bin/ipykernel install --user --name $1 --display-name "$1"
fi

echo "------------------------------------------------------------------------------------"
jupyter kernelspec list

