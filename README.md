
# Linux System Monitor

A simple Linux-based system monitoring project that tracks **CPU usage, RAM usage, and disk usage** and generates alerts when resource utilization exceeds predefined thresholds.

This project is suitable for an Operating Systems (OS) mini-project and provides a basic way to monitor system resources using Bash scripting.

## Features

- **CPU Monitoring:** Tracks CPU load or system load, depending on the selected script.
- **Memory Monitoring:** Displays RAM usage as a percentage.
- **Disk Monitoring:** Tracks disk space usage on the root partition (`/`).
- **Threshold Alerts:** Generates alerts when resource usage exceeds configured limits.
- **Automatic Updates:** Refreshes monitoring data every 5 minutes.
- **Log File:** Writes monitoring results to `data/data.log`.
- **Web Dashboard:** Open `index.html` in a browser for a visual interface.

## Project Structure

```text
Linux-system-monitor/
├── scripts/
│   ├── script.sh
│   └── monitor.sh
├── data/
│   └── data.log
├── index.html
└── README.md
```

> The structure above assumes the scripts are inside `scripts/` and the dashboard and data directory are at the repository root. Adjust paths if your repository differs.

## How to Use

### 1. Clone the Repository

```bash
git clone https://github.com/AbhijeetNagar56/Linux-system-monitor.git
cd Linux-system-monitor
```

### 2. Make the Scripts Executable

```bash
chmod +x scripts/script.sh scripts/monitor.sh
```

### 3. Run the Monitor

Choose either script:

**Option A — `script.sh`**

```bash
./scripts/script.sh
```

**Option B — `monitor.sh`**

```bash
./scripts/monitor.sh
```

Run only one script at a time unless you intentionally want multiple monitoring processes.

### 4. Configure Alert Thresholds

Edit the selected script to change the thresholds:

```bash
CPU_THRESHOLD=80
MEM_THRESHOLD=80
DISK_THRESHOLD=90
```

These values represent the configured alert limits.

- CPU: 80
- RAM: 80%
- Disk: 90%

**Note:** In `monitor.sh`, CPU load is obtained from the system load average, which is not the same as CPU utilization percentage. For accurate CPU percentage monitoring, use a CPU utilization calculation instead.

### 5. View the Logs

Monitoring results are written to:

```text
data/data.log
```

To view the latest output in the terminal:

```bash
cat data/data.log
```

To watch the log update automatically:

```bash
watch -n 2 cat data/data.log
```

The monitoring scripts refresh the log every 5 minutes (300 seconds).

### 6. Open the Web Dashboard

Open `index.html` in your browser to view the project's monitoring dashboard.

If the dashboard uses JavaScript to fetch the log file, browser security restrictions may prevent it from reading local files directly. In that case, start a local HTTP server from the repository root:

```bash
python3 -m http.server 8000
```

Then visit:

```text
http://localhost:8000
```

Ensure the dashboard reads the correct log path and expects the same log format produced by the selected script.

## Alert Configuration

The monitor checks resource usage against the configured thresholds.

| Resource | Default Threshold |
|---|---:|
| CPU | 80% |
| RAM | 80% |
| Disk | 90% |

When a threshold is exceeded, an alert is generated. Depending on the script, alerts are printed in the terminal or written to the log file.

## Requirements

- Linux operating system
- Bash
- `top`, `free`, `df`, `awk`, `grep`, `sed`, and `cut` utilities as required by the selected script
- Python 3 (optional, for serving the dashboard locally)

## Stopping the Monitor

Press `Ctrl + C` in the terminal where the script is running.

## Future Improvements

- Real-time dashboard updates
- Graphs for CPU, RAM, and disk usage
- Email or desktop notifications
- Configurable monitoring intervals
- Process-level resource monitoring
- Historical logs and usage reports

## Contributing

Contributions are welcome!

1. Fork this repository.
2. Create a new branch.
3. Make your changes.
4. Submit a pull request.

Pull requests will be reviewed before merging.
```
