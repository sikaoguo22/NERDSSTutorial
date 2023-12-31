## Quick Start Guide for NERDSS Setup

**Note**:

If you prefer using [Docker](https://www.docker.com) for environment setup (it might be slow), jump directly to **Step 4**.

Windows OS: It's recommended to use either Windows Subsystem for Linux (WSL) or [Docker](https://www.docker.com).

**Step 1: Clone the Repository**

```bash
git clone https://github.com/mjohn218/NERDSS.git
```

**Step 2: Install Dependencies**

- **For Ubuntu or WSL:**

```bash
sudo apt-get update && sudo apt-get install -y build-essential libgsl-dev
```

- **For macOS:**

Install Homebrew:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Install GCC and GSL:

```bash
brew update
brew install gcc gsl
```

**Step 3: Compile NERDSS**

Navigate to the NERDSS directory and compile:

```bash
cd NERDSS
make serial
```

The resulting executable will be located in the `bin` folder.

**Install ioNERDSS library from PyPi**

Install [Anaconda](https://www.anaconda.com/download/), then

```bash
conda create --name ionerdss
conda activate ionerdss
conda install pip
pip install ioNERDSS
pip install jupyter
```

**Step 4: Using Docker for Environment Setup (Optional)**

If you'd rather not install the required tools directly on your machine, you can use Docker:

- Install [Docker](https://www.docker.com)

- Pull the pre-configured Docker image:

Intel Chip:
```bash
docker pull sikaoguo/nerdsstutorial:latest
```
Mac M1 Chip:
```bash
docker pull sikaoguo/nerdsstutorial:m1
```

- Launch the Docker image:

To run `nerdss` with the `.inp` file in the current folder and start Jupyter for analyze after the simulation done:
```bash
docker run -e RUN_NERDSS=true -e ANALYZE_OUTPUT=true -p 8888:8888 -v $(pwd):/SIMULATION -it sikaoguo/nerdsstutorial:latest
```
To run only `nerdss`:
```bash
docker run -e RUN_NERDSS=true -v $(pwd):/SIMULATION -it sikaoguo/nerdsstutorial:latest
```
To start only `Jupyter`:
```bash
docker run -e ANALYZE_OUTPUT=true -p 8888:8888 -v $(pwd):/SIMULATION -it sikaoguo/nerdsstutorial:latest
```
To run Container only:
```bash
docker run -v $(pwd):/SIMULATION -it sikaoguo/nerdsstutorial:latest
```

Note: Replace `$(pwd)` with `${PWD}` in Windows powershell.

When you do the above, any changes you make to current folder on your local machine will be reflected in `/SIMULATION` in the Docker container, and vice versa.

1. Copying files from host to container: 
    ```bash
    docker cp <path-on-host> <container-id-or-name>:<path-in-container>
    ```

2. Copying files from container to host:
    ```bash
    docker cp <container-id-or-name>:<path-in-container> <path-on-host>
    ```
