#!/usr/bin/bash

set -e
set -x

if ! command -v git; then
  yum install -y git
fi

if ! command -v ansible; then
  yum install -y ansible 
fi

if [ ! -d my-ansible ]; then
  git clone https://github.com/cubeek/my-ansible
fi

if [ ! -e centos-devstack-vqfx/roles ]; then
  rm -f centos-devstack-vqfx/roles
  ln -s $PWD/my-ansible/roles centos-devstack-vqfx/roles
fi
