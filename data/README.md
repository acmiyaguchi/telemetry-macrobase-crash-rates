# Data
## crash_rates postgres image

This directory contains a dockerfile for building a postgres image with crash_rates data.

```
$ aws s3 cp s3://net-mozaws-prod-us-west-2-pipeline-analysis/amiyaguchi/macrobase/crash_rates.csv .
$ docker build . -t postgres-crash-rates
$ docker run --rm -P --name crash-rates-db postgres-crash-rates
```

`--rm` deletes the container on exit. `-P` exposes the docker port and maps it to a local port. Running `docker ps` shows this mapping.
```
$ docker ps
CONTAINER ID        IMAGE                        COMMAND                  CREATED             STATUS                         PORTS                     NAMES
49e2dc825e66        postgres-crash-rates         "docker-entrypoint..."   0 minutes ago       Up 0 minutes                   0.0.0.0:32772->5432/tcp   crash-rates-db
```

A local postgres client (`psql`) can be attached to this instance.
```
$ psql -h localhost -p 327772 -U postgres
postgres-# \dt
            List of relations
 Schema |    Name     | Type  |  Owner
--------+-------------+-------+----------
 public | crash_rates | table | postgres
(1 row)

postgres-# SELECT * FROM crash_rates LIMIT 10
```

## `crash_rates.v1`

The data processing notebook stores data in the following directory:

```
s3://net-mozaws-prod-us-west-2-pipeline-analysis/amiyaguchi/macrobase/crash_rates/v1
```

It contains the following fields, as of `v1`.

```
root
 |-- timestamp: long (nullable = true)
 |-- sample_id: string (nullable = true)
 |-- normalized_channel: string (nullable = true)
 |-- env_build_version: string (nullable = true)
 |-- env_build_id: string (nullable = true)
 |-- app_name: string (nullable = true)
 |-- os: string (nullable = true)
 |-- os_version: string (nullable = true)
 |-- env_build_arch: string (nullable = true)
 |-- country: string (nullable = true)
 |-- active_experiment_id: string (nullable = true)
 |-- active_experiment_branch: string (nullable = true)
 |-- e10s_enabled: boolean (nullable = true)
 |-- e10s_cohort: string (nullable = true)
 |-- gfx_compositor: string (nullable = true)
 |-- usage_khours: double (nullable = true)
 |-- crashes_detected_content: integer (nullable = true)
 |-- crashes_detected_plugin: integer (nullable = true)
 |-- crashes_detected_gmplugin: integer (nullable = true)
 |-- crashes_detected_content_rate: double (nullable = true)
 |-- crashes_detected_plugin_rate: double (nullable = true)
 |-- crashes_detected_gmplugin_rate: double (nullable = true)
 |-- submission_day: integer (nullable = true)
 |-- submission_date_s3: string (nullable = true)

```
