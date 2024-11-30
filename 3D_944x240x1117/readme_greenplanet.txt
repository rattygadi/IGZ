# Instructions for building and running Ryder_2019 on greenplanet (gp)

================
# 1. Get code
   git clone git@github.com:rattygadi/IGZ
   git clone https://github.com/MITgcm/MITgcm.git -b checkpoint68c
   cd MITgcm
   mkdir build run

================
# 2. Build executable
   cd  build
   ml intel/2020.4 intelmpi/2019.9
   ../../../tools/genmake2 -code=../code_Petermann_3D_no_IGZ/ -of=../../../tools/build_options/linux_amd64_ifort+impi_edit 
   make depend
   make -j 2

================
# 3. Instructions for running MITgcm simulation
   cd ../run
   ln -sf ../build/mitgcmuv .
   cp ../input/* .
   sbatch slurm_mitgcm.sh

