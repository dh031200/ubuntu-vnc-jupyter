#!/bin/bash

if [ ! -e ".setup_finish" ]
then
    echo "Current password is   ↓↓↓"
    passwd
    echo ""
    if [ ! -d ".vnc" ]
    then
        echo "Do you want to set VNCserver [Y/n]"
        read vnc
        if [ "$vnc" = "n" ] || [ "$vnc" = "N" ]
        then
            echo "Skip setting vncserver"
        else
            echo "Enter password 2 times to set vnc password."
            echo "Then choose 'n' for fully control."
            vncserver -localhost no
            vnc="y"
        fi
        echo ""
    fi

    if [ -e "Miniconda3-latest-Linux-x86_64.sh" ]
    then
        echo "Do you want to install miniconda [Y/n]"
        read conda
        if [ "$conda" = "n" ] || [ "$conda" = "N" ]
        then
            echo "Skip install miniconda"
        else
            bash Miniconda3-latest-Linux-x86_64.sh   
        fi
        rm Miniconda3-latest-Linux-x86_64.sh
        echo ""
    fi

    echo "Do you want to install JupyterLab [Y/n]"
    read jupyter
    if [ "$jupyter" = "n" ] || [ "$jupyter" = "N" ]
    then
        echo "Skip install jupyterlab"
        rm cck.sh
        rm cdk.sh
    else
        if [ "$conda" = "n" ] || [ "$conda" = "N" ]
        then
            pip install jupyterlab
        else
            ~/miniconda3/bin/python -m pip install jupyterlab
        fi
        sudo mv cck.sh /usr/bin
        sudo mv cdk.sh /usr/bin
        echo "alias connect_kernel='cck.sh'" >> ~/.bashrc
        echo "alias disconnect_kernel='cdk.sh'" >> ~/.bashrc
        echo ""
        echo "Do you want to automatically start jupyterlab when you start the container? [Y/n]"
        read auto
        if [ "$auto" = "n" ] || [ "$auto" = "N" ]
        then
            echo "Command for start jupyterlab."
            echo "jupyter lab --allow-root --ip 0.0.0.0 --no-browser"
        else
            touch .jupyter_auto_start
        fi
    fi
    touch .setup_finish
fi

if [ -e ".jupyter_auto_start" ]
then
    if [ -d miniconda3 ]
    then
        nohup ~/miniconda3/bin/python -m jupyter lab --allow-root --ip 0.0.0.0 --no-browser  >> jupyter.log &
    else
        nohup ~/.local/bin/jupyter lab --allow-root --ip 0.0.0.0 --no-browser  >> jupyter.log &
    fi
    sleep 1
    tail jupyter.log -n 5
    echo "                                        ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑"
    echo "Please set your Password for jupyterlab using the token above."
    echo "http://localhost:3131/"
    echo "The port should be docker container binding port"
fi

if [ ! -d ".vnc" ]
then
    echo ""
else
    if [ "$vnc" = "" ]
    then
        sudo rm /tmp/.X1-lock
        sudo rm -r /tmp/.X11-unix
        sudo rm ~/.vnc/*.pid
        sudo rm ~/.vnc/*.log
        vncserver -localhost no
    fi
fi

bash