DROP TABLE IF EXISTS crash_rates;

CREATE TABLE crash_rates (
       timestamp BIGINT,
       normalized_channel VARCHAR,
       env_build_version VARCHAR,
       env_build_id VARCHAR,
       app_name VARCHAR,
       os VARCHAR,
       os_version VARCHAR,
       env_build_arch VARCHAR,
       country VARCHAR,
       active_experiment_id VARCHAR,
       active_experiment_branch VARCHAR,
       e10s_enabled VARCHAR,
       e10s_cohort VARCHAR,
       gfx_compositor VARCHAR,
       crashes_detected_content_rate DOUBLE PRECISION,
       crashes_detected_plugin_rate DOUBLE PRECISION,
       crashes_detected_gmplugin_rate DOUBLE PRECISION
);

COPY crash_rates FROM '/crash_rates.csv' DELIMITER ',' CSV HEADER;
