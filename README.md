## Pre-requisites
- docker
- git
- make

## Installation and Operation
1. Clone the repository
```bash
git clone https://github.com/hyperion1209/app_monitor_docker.git
```
2. Build the docker image
```bash
cd app_monitor_docker
make docker
```
3. Create config file
```bash
cd ..
mkdir app_dir
```
Using your favorite editor create a file named `config.json` in the `app_dir` directory. The file should have the following format:
```json
{
    "endpoints": [
        "https://endpoint1/path/to/status",
        "https://endpoint2/path/to/status"
    ],
    "check_interval": 1,
    "warn_threshold": 1.2
}
```
4. Run the application
```bash
cd app_monitor_docker
./start_monitor.sh <path_to_config_dir>
```
5. View log messages
Log output can be seen in the run.log file in the `app_dir` directory.
```bash
tail -f app_dir/run.log

```
