# Instructions for building and running 3D_944x240x1117 on pleiades

==============
# 1. Get code
  git clone git@github.com:rattygadi/IGZ
  git clone https://github.com/MITgcm/MITgcm.git -b checkpoint68c
  cd MITgcm
  mkdir build run

==============
# 2. Build executable
  cd build
  module purge
  module load comp-intel mpi-hpe python3
  module load hdf4/4.2.12 hdf5/1.8.18_mpt netcdf/4.4.1.1_mpt
  ../tools/genmake2 -mo ../../ecco_darwin/regions/RedSea/v05/code -mpi \
   -of ../../ecco_darwin/regions/RedSea/v05/code/linux_amd64_ifort+mpi_ice_nas
  make depend
  make -j

==============
# 3. Instructions for running simulation (1992-2023 period)
  cd ../run
  ln -sf ../build/mitgcmuv .
  cp ../../IGZ/3D_944x240x1117/input/* .
  mpirun -np 256 ./mitgcmuv
#    or modify a job_IGZ as needed and then:
#    qsub job_IGZ
