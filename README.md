# telemetry-macrobase-crash-rates

Notebooks and code for reproducing macrobase analysis over Firefox telemetry data.

## Quickstart

The easiest way to explore the `crash_rates` dataset with MacroBase is to use the GUI.

Follow the [tutorial](https://github.com/stanford-futuredata/macrobase/wiki/Tutorial) to download and package MacroBae.

The `/data` folder contains instructions on how to obtain the `crash_rates` dataset, as well as some additional scripts for loading a docker image with the data.

Replace step 3 with the following, with more detailed instructions in `/data`:

* 3a. Download a preprocessed dataset -- `crash_rates.csv`
* 3b. Build the `postgres-crash-rates` docker container
* 3c. Append the line `macrobase.loader.db.user: postgres` to `macrobase/conf/macrobase.conf`

The port of the postgres container can be found through `docker ps`

Finally, once in the MacroBase GUI, replace `localhost` with `localhost:PORT`. `PORT` will be localized to your machine.

