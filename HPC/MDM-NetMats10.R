#!/usr/bin/env Rscript
#$ -S /usr/bin/Rscript
#$ -l h_vmem=256M
#$ -l h_rt=00:03:30
#$ -t 12801:16800
#$ -cwd
#$ -o $HOME/log
#$ -e $HOME/log

# @libraries and paths ----
#install_github("schw4b/mdm@v1.1.2")
#system("module load gcc")
library(multdyn)
library(testit)

PATH        = '~/Drive/HCP900_Parcellation_Timeseries_Netmats_ICAd25/'
PATHDATA    = '~/Drive/HCP900_Parcellation_Timeseries_Netmats_ICAd25/node_timeseries/3T_HCP820_MSMAll_d25_ts2/'
PATHRESULTS = '~/Drive/MDM_NetMats10_results'
INFO        = 'NetMats10'

N_total = 820
N_Comp  = 10 # RSNs
N_Comp_max = 25 # NetSim25 total components
N_t     = 1200 # Volumes/no. of timepoints
N_runs  = 4 # No. of runs
COMP    = sort(c(3,1,4,2,18,14,19,21,5,10))

# @read subject IDs and subject data ----
SUBJECTS = as.matrix(read.table(file.path(PATH,'subjectIDs.txt')))
assert(length(SUBJECTS)==N_total)

# @lookup table across subjects and nodes ----
# Table is ordered: first all components, then all runs from 1 subject, then next subject.
# Fist subject is t 1:40
mysubs = sort(rep(SUBJECTS,N_runs*N_Comp))
myruns = rep(sort(rep(1:N_runs,N_Comp)), N_total)
mycomp = rep(1:N_Comp,N_runs*N_total)
TABLE = cbind(mysubs,myruns,mycomp)

# @load data of subject ----
l = as.numeric(Sys.getenv("SGE_TASK_ID")) # line iterator for Lookab TABLE that runs multicore
f=list.files(PATHDATA, glob2rx(paste(TABLE[l,1], '*.txt', sep="")))

# read data
d = as.matrix(fread(file.path(PATHDATA, f)))
assert(nrow(d) == N_t*N_runs)
assert(ncol(d) == N_Comp_max)

# select run 1,2,3 or 4 and the 10 components
d=d[((TABLE[l,2]-1)*(N_t)+1):(N_t*TABLE[l,2]),COMP] # double check this! sorted COMP correspond to 1:10
assert(nrow(d) == N_t)
assert(ncol(d) == N_Comp)

# mean center time series
d=center(d)
#plot.ts(d)

# calculate networks, will write txt files
m=node(d, TABLE[l,3], id=sprintf("%d_Run_%03d_Comp_%03d_%s", TABLE[l,1], TABLE[l,2], TABLE[l,3], INFO),
       path = PATHRESULTS)

q(save="no")

