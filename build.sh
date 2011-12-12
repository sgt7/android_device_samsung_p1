#!/bin/bash

cd kernel/samsung/galaxytab
./build_kernel.sh
cd ../../..

source build/envsetup.sh
lunch cm_galaxytab-eng
make -j8 bacon

