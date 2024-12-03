#!/bin/bash
#SBATCH --job-name=3D_test_1
##SBATCH --workdir=
#SBATCH -p sib2.9,nes2.8,ilg2.3
#SBATCH -n 256
##SBATCH --nodelist=c-13-28
#SBATCH --mem-per-cpu=2G
#SBATCH -t 20-00:00
#SBATCH --no-kill
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=rgadi@uci.edu

ml intel/2020.4 intelmpi/2019.9
srun ./mitgcmuv
