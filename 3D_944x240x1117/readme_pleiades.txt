# Instructions for building and running 3D_944x240x1117 on pleiades

==============
# 1. Get code
  git clone git@github.com:rattygadi/IGZ
  git clone https://github.com/MITgcm/MITgcm.git -b checkpoint68c
  cd MITgcm
  mkdir build run

==============
# 2. Build executable for noIGZ set-up
  cd build
  module purge
  module load comp-intel/2020.4.304
  module load mpi-hpe/mpt
  module load hdf4/4.2.12 hdf5/1.8.18_mpt netcdf/4.4.1.1_mpt
  ../tools/genmake2 -mo ../../IGZ/3D_944x240x1117/code_noIGZ -mpi \
   -of ../../IGZ/build_options/linux_amd64_ifort+mpi_ice_nas
  make depend
  make -j

==============
# 3. Instructions for running simulation
  cd ../run
  ln -sf ../build/mitgcmuv .
  cp ../../IGZ/3D_944x240x1117/input/* .
  ln -sf ~dmenemen/IceGroundingZone/3D_944x240x1117_bin/* .
#  mpirun -np 256 ./mitgcmuv
#  or modify job_IGZ as needed and then:
  qsub job_IGZ
