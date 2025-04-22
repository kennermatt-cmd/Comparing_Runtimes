

### `CONTRIBUTING.md`


# Contributing to Comparing_Runtimes

Thanks for contributing! This guide will help you get set up and follow best practices for collaboration.

---

## Getting Started

Clone the repository:

```bash
git clone https://github.com/your-username/Comparing_Runtimes.git
cd Comparing_Runtimes
```

---

## Project Structure

```
Comparing_Runtimes/
├── analysis/             # All .sh and .py analysis scripts
├── benchmark/            # Sorting algorithms and benchmark logic
├── data/
│   ├── charts/           # Output plots
│   ├── input/            # Input data files
│   └── logs/             # Log files (timings, resource traces)
├── environments/         # Dockerfile and environment definitions
├── report/               # Written report
├── presentation/         # Final presentation slides
```

---

## Dependencies

### Recommended (Virtual Environment)

```bash
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
```

### Alternatively (System-wide)

```bash
pip3 install --break-system-packages matplotlib pandas psrecord
```

---

## How to Contribute

1. **Pull the latest changes** before working:
   ```bash
   git pull origin main
   ```

2. **Create a new branch** for your feature or fix:
   ```bash
   git checkout -b feature/my-feature-name
   ```

3. **Make changes**, then commit:
   ```bash
   git add .
   git commit -m "Brief description of changes"
   ```

4. **Push your branch**:
   ```bash
   git push origin feature/my-feature-name
   ```

5. Open a **Pull Request** on GitHub with a short summary of your contribution.

---

## Running Benchmarks

Each environment benchmark is run using:

```bash
bash analysis/resource_trace.sh native
bash analysis/resource_trace.sh vm
bash analysis/resource_trace.sh docker
```

This logs:
- Total time (real/user/sys)
- CPU and memory usage via `psrecord`
- Chart output to `data/charts/`
- Logs to `data/logs/`

---

## Housekeeping

- Commit only files relevant to your feature.
- Avoid committing large `.pyc`, `.log`, or data dumps.
- Use consistent formatting (auto-format with `black` if needed).
- Ensure scripts run without error before pushing.

---

## Questions?

Ping a teammate or file an issue in the repo if you're stuck. Thanks for improving this project!
```

---

Let me know if you want to:
- Add contributor roles
- Include GitHub issue templates
- Add a testing section for validation scripts