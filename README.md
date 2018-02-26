# DGM simulations and applications with real data

For questions and collaboration write to [schw4b@gmail.com](schw4b@gmail.com).

## How to cite this work
Schwab, S., Harbord, R., Zerbi, V., Elliott, L., Afyouni, S., Smith, J. Q., … Nichols, T. E. (2017, October 5). Directed functional connectivity using dynamic graphical models. *bioRxiv*. [doi:10.1101/198887](https://doi.org/10.1101/198887)

## Notebooks with results and figures
- [DGM-Simulations](https://rawgit.com/schw4b/DGM-Sim/master/results/DGM-Simulations.nb.html)
- [DGM-RSN10](https://rawgit.com/schw4b/DGM-Sim/master/results/DGM-RSN10.nb.html)
- [DGM-Mouse](https://rawgit.com/schw4b/DGM-Sim/master/results/DGM-Mouse.nb.html)

## Reproducing full analysis

* Clone this repository.
* Install all packages suggested at the top of the notebook.
* Adjust the `PATH_HOME` and `PATH` variables at the top of the notebooks.
* You may (re)estimate all networks with [`DGM`](https://cran.r-project.org/web/packages/DGM/index.html) but the notebook will load the already computed networks.
* As I will not provide the HCP and mouse time series, so time-series related chunks need to be disabled for the Notebook to completely run.

## Obtaining the data
#### Network data
* All network data (from simulations, human fMRI and mouse fMRI) can be produced with [`DGM`](https://cran.r-project.org/web/packages/DGM/index.html) or loaded from the `RData` containers in the results folder.

#### Raw time series
* Simulation time series are in this repository except sim1 and sim22 which can be obtained from the FMRIB [NetSim Website](http://www.fmrib.ox.ac.uk/datasets/netsim/). The Notebook will download these automatically and will extract them.
* Human RSN time series can be obtained from the Human Connectome Project, Parcellation+Timeseries+Netmats (PTN) from [here](https://db.humanconnectome.org).
* Mouse time-series is not open and must be requested from [valerio.zerbi@hest.ethz.ch](valerio.zerbi@hest.ethz.ch), but the network data is available.

## Refs
2. Smith, S. M., Miller, K. L., Salimi-Khorshidi, G., Webster, M., Beckmann, C. F., Nichols, T. E., et al. (2011). Network modelling methods for FMRI. *NeuroImage*, 54(2), 875–91. [doi:10.1016/j.neuroimage.2010.08.063](http://dx.doi.org/10.1016/j.neuroimage.2010.08.063).

## Additonal Analyses
- [DGM-Stepwise](https://rawgit.com/schw4b/DGM-Sim/master/results/DGM-Step.nb.html)
