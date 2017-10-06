# DGM

## How to cite
Schwab S, Harbord R, Zerbi V, Elliott L, Afyouni S, Smith JQ, Woolrich MW, Smith SM, Nichols TE (2017). Directed Functional Connectivity Using Dynamic Graphical Models. *bioRxiv*. [doi:10.1101/198887](http://dx.doi.org/10.1101/198887).

## Notebooks with results and figures
- [DGM-Simulations](https://rawgit.com/schw4b/DGM/master/results/DGM-Simulations.nb.html)
- [DGM-RSN10](https://rawgit.com/schw4b/DGM/master/results/DGM-RSN10.nb.html)
- [DGM-Mouse](https://rawgit.com/schw4b/DGM/master/results/DGM-Mouse.nb.html)

## Reproducing full analysis

* Clone this repository.
* Install all packages suggested at the top of the notebook.
* Adjust PATH variables at the top of the notebooks.
* Estimate all networks with [`multdyn`](https://cran.r-project.org/web/packages/multdyn/index.html) or request the network data.

## Obtaining the data
#### Network data
* All network data (from simulations, human fMRI and mouse fMRI) can be produced with [`multdyn`](https://cran.r-project.org/web/packages/multdyn/index.html) or requested from [schw4b@gmail.com](schw4b@gmail.com).

#### Raw time series
* Simulations time series are in this repository except sim1 and sim22 which can be obtained from the FMRIB [NetSim Website](http://www.fmrib.ox.ac.uk/datasets/netsim/).
* Human RSN time series can be obtained from the Human Connectome Project, Parcellation+Timeseries+Netmats (PTN) from [here](https://db.humanconnectome.org).
* Mouse time-series must be requested from [valerio.zerbi@hest.ethz.ch](valerio.zerbi@hest.ethz.ch).
