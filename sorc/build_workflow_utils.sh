#!/bin/bash
set -eux

[[ $(uname -s) == Darwin ]] && cmd=$(which greadlink) || cmd=$(which readlink)
readonly UTILS_DIR=$(cd "$(dirname "$($cmd -f -n "${BASH_SOURCE[0]}" )" )" && pwd -P)

# Adapt for global-workflow structure.
source ${UTILS_DIR}/machine-setup.sh > /dev/null 2>&1
target=${target:-"NULL"}
modulefile=${UTILS_DIR}/../modulefiles/workflow_utils.$target
if [[ -f $modulefile ]]; then
  set +x
  source $modulefile
  module list
  set -x
fi
# End adaptation

# Begin hack
# In place until nceplibs-ncio is in hpc-stack and available as a module
# After nceplibs-ncio is in hpc-stack, add the following line to
# ${UTILS_DIR}/../modulefiles/workflow_utils.<platform>
# "module load ncio/<ncio-version>"
# and remove this hack

[[ -d nceplibs-ncio ]] && rm -rf nceplibs-ncio
git clone -b develop https://github.com/noaa-emc/nceplibs-ncio
cd nceplibs-ncio
mkdir -p build && cd build
cmake -DCMAKE_INSTALL_PREFIX=../install ..
make -j ${BUILD_JOBS:-4} VERBOSE=${BUILD_VERBOSE:-}
make install
cd ../..
export ncio_ROOT=$PWD/nceplibs-ncio/install
# End hack

BUILD_DIR=${BUILD_DIR:-${UTILS_DIR}/build}
[[ -d $BUILD_DIR ]] && rm -rf $BUILD_DIR
mkdir -p ${BUILD_DIR}
cd $BUILD_DIR

INSTALL_DIR=${INSTALL_DIR:-${UTILS_DIR}/install}

CMAKE_FLAGS+=" -DCMAKE_INSTALL_PREFIX=$INSTALL_DIR"

cmake ${UTILS_DIR} ${CMAKE_FLAGS}
make -j ${BUILD_JOBS:-4} VERBOSE=${BUILD_VERBOSE:-}
make install
