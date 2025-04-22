

### `CONTRIBUTING.md`


# Contributing to Comparing_Runtimes

Thanks for contributing! This guide will help you get set up and follow best practices for collaboration.

---

## Getting Started

### 1. Check for existing SSH Key:
```bash
ls -al ~/.ssh
```
### 2. Generate a new SSH key (if needed)
```bash
ssh-keygen -t ed25519 -C "your_email@example.com"
```
Press enter *3 for defaults  
### 3. Copy your public key to clipboard
```bash
cat ~/.ssh/id_ed25519.pub
```
### 4. Add your key to GitHub
Go to your GitHub account → Settings

Navigate to SSH and GPG keys

Click New SSH key

Paste your copied key and give it a name (like "my-laptop")

### 5. Test your SSH connection
```bash
ssh -T git@github.com
```
### 6. Clone the repository:

```bash
git clone git@github.com:kennermatt-cmd/Comparing_Runtimes.git
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
cd environments/vm/
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