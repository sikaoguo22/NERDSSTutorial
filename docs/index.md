# Welcome to NERDSS

 NERDSS is a structure-resolved reaction-diffusion simulation software developed by [Johnson Lab, JHU](https://sites.krieger.jhu.edu/johnson-lab/)

## Quick Start Guide for NERDSS Setup

**Note**:

If you prefer using Docker for environment setup, jump directly to **Step 4**.

Windows users: It's recommended to use either Windows Subsystem for Linux (WSL) or Docker.

**Step 1: Clone the Repository**

```bash
git clone https://github.com/mjohn218/NERDSS.git
```

**Step 2: Install Dependencies**

- **For Ubuntu or WSL:**

```bash
sudo apt-get update && sudo apt-get install -y g++ libgsl-dev
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
make
```

The resulting executable will be located in the `bin` folder.

**Step 4: Using Docker for Environment Setup (Optional)**

If you'd rather not install the required tools directly on your machine, you can use Docker:

- Build the Docker image using the provided [Dockerfile](./Dockerfile):

```bash
docker build -t my_nerdss_image .
```

Run the Docker container:

```bash
docker run -it -v $(pwd):/NERDSS my_nerdss_image
```

This command mounts your current directory to the `/NERDSS` directory inside the container. Changes made inside the container's `/NERDSS` directory will reflect in your host system's current directory and vice versa.
