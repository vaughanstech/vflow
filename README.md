# vflow

Barebones Apache Airflow setup.

# Initial Setup

I *highly* recommend running `vflow` in a python virtual environment. You can do this by:

1. Ensuring that you have the virtual environment tools for Python installed on your system
```bash
sudo apt update && sudo apt install python3-venv -y
```
2. Create a virtual environment
```bash
python3 -m venv <venv-name>
```
- Where `<venv-name>` is the custom name of the virtual environment. For example, I called mine `vflow`
3. Activate the virtual environment
```bash
source venv-name/bin/activate
```
4. (Optional) Install dependencies from virtual environment, if not installed
```bash
pip3 install -r requirements.txt
```
- This should install all Python packages that are pre-installed on the branch
5. (Optional) Add newly installed dependencies to the requirments.txt
```bash
pip3 freeze > requirement.txt
```
6. Deactivate the virtual environment
```bash
deactivate
```

# Running VFlow for the first time

If running Airflow for the first time, make sure you run the initial setup to make sure all configurations are properly applied to your machine

```bash
docker compose -f docker-compose.yaml up --build
```
- This will begin setup of default configurations for the Airflow webserver and UI from the `airflow-init` step in the `docker-compose.yaml` file

# Attempt logging into Airflow UI

In a web browser, go to `localhost:8080`. Once there, use the default credentials of Username=admin and Password=admin to login to the webserver.

- There will be no DAGs loaded in the UI at first, this is expected. If you want to have test DAGs be loaded into your Airflow, set the variable `AIRFLOW__CORE__LOAD_EXAMPLES` to `true` in the `docker-compose.yaml` file.

# Inspecting containers

To inspect all containers running on your machine, use the command `docker ps`

# Shutting down containers

To shutdown all containers on your system run the command `docker compose down`

# Remove containers and volumes (not recommended)

It is not recommended but if you need to delete all containers and volumes from your system run the command `docker compose down --volumes --remove orphans`

- This is not recommended because you will need to re-run the initialization of Airflow after the volumes are removed since your Airflow user will be deleted in the process.
- The only time I would recommend removing containers and volumes from your system is if you no longer want Airflow on your system
