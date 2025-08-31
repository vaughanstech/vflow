# Base image
FROM debian:bullseye

# Install dependencies
RUN apt-get update && \
    apt-get install -y \
    python3 python3-pip python3-venv curl \
    build-essential libpq-dev libsasl2-dev libffi-dev libssl-dev \
    default-libmysqlclient-dev git && \
    rm -rf /var/lib/apt/lists/*

# Set environment variables
ENV AIRFLOW_HOME=/opt/airflow
ENV PATH="${AIRFLOW_HOME}/.local/bin:$PATH"

# Create Airflow user
RUN useradd -ms /bin/bash airflow
WORKDIR ${AIRFLOW_HOME}
RUN chown -R airflow:airflow ${AIRFLOW_HOME}

# Install Airflow
COPY requirements.txt .
RUN pip3 install --upgrade pip && pip3 install -r requirements.txt
RUN mkdir -p ./opt/airflow/dags ./opt/airflow/logs ./opt/airflow/plugins ./opt/airflow/config
RUN chown -R 50000:0 ./opt/airflow/dags ./opt/airflow/logs ./opt/airflow/plugins ./opt/airflow/config

USER airflow