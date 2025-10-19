# py-uv-dev-template
This is a ready-to-use Dev Container template for Python + uv.
It lets you create consistent, portable dev environments across machines — fast.
## 1. Prerequisites
1. Docker Desktop (running)
2. Visual Studio Code with extensions:
 - Dev Containers (ms-vscode-remote.remote-containers)
 - Docker (ms-azuretools.vscode-docker)
 - Python (ms-python.python)
 - Pylance (ms-python.vscode-pylance)
 - Ruff (charliermarsh.ruff)
 - Black Formatter (ms-python.black-formatter)
3. Git and GitHub CLI (gh)
 - You must be logged into GitHub CLI

## 2. How to use
### 2.1. Get a local copy of this template
  **Choose one:**
  - A) GitHub CLI (recommended)
  `gh repo clone <your-username>/py-uv-dev-template`
  `cd py-uv-dev-template`
  - B) Git over HTTPS
  `git clone https://github.com/<your-username>/py-uv-dev-template.git`
  `cd py-uv-dev-template`
  - C) Download ZIP
  *GitHub → Code → Download ZIP*
  *Unzip → open folder in VS Code*
  **If you want to use new.sh, A or B is better.**

### 2.2. Verify template files
From the repo root, you should have:

.devcontainer/
  devcontainer.json   # VS Code dev container config
  Dockerfile          # Base image (Python 3.12) + build tools
  post-create.sh      # Installs uv, creates .venv, installs ruff/black

.vscode/
  settings.json       # Python/.venv/ruff/format on save
  launch.json         # Debug: run current file

src/
  app.py              # Minimal hello-world script

.gitignore            # Ignore .venv, __pycache__, .vscode, etc.

LICENSE (MIT)

README.me

new.sh                # Bootstrap script to create projects from this template

If new.sh isn’t executable yet:
`chmod +x new.sh`

### 2.3. Create a new project from this template (bootstrap script)
Use new.sh to create a new GitHub repo from this template, clone it locally, and open it in VS Code.
**from the template repo root**
`./new.sh <project-name> [public|private]`
- <project-name> = the new repo name on GitHub (required)
- Visibility defaults to private if omitted

**Examples:**
`./new.sh my-service`
`./new.sh my-public-service public`

**What the script does (step-by-step)**
- Checks your setup
- Confirms gh is installed and you’re logged in (gh auth status)
- Confirms this template is linked to GitHub (so it can copy from it)
- Creates a new GitHub repo
- Uses “Create from template” with this repo as the source
- Visibility = private by default (or public if specified)
- Clones the new repo locally
- Runs gh repo clone <owner>/<project-name>
- Creates a new local folder named <project-name>
- Opens the project in VS Code
- Uses the code command if available; otherwise prompts you to open it manually
  
### 2.4. Open and build the Dev Container
Inside your new project:
1. Reopen in container
*VS Code → Command Palette → Dev Containers: Reopen in Container*
This builds the Docker image and starts a container using .devcontainer/.
2. Post-create steps run automatically
.devcontainer/post-create.sh will:
- Install uv to ~/.local/bin
- Create a .venv in your project
- Install ruff and black
If it didn’t run: Dev Containers: Rebuild and Reopen in Container
Ensure the virtual environment exists (idempotent)
`uv venv`

### 2.5. First run (hello world)

**Inside the container terminal:**
  1. `uv --version`
  2. `python --version`
  3. `uv run python src/app.py`
  4. 
**Expected output:**
Hello from Dev Container template!

## 3. Daily workflow (in a generated project)
1. Start work
  - `git pull`
  - `uv venv`
  - `uv pip install <any-new-dependency>`
  
2. Run
  - `uv run python src/app.py`

3. Lint / Format
(Automatic on save via VS Code settings) or:
  - `ruff check .`
  - `black .`

4. Commit & push
  - `git add .`
  - `git commit -m "feat: implement X"`
  - `git push`

## 4. Troubleshooting
- VS Code says “Invalid Python interpreter”
  The workspace points to .venv/bin/python. If .venv doesn’t exist yet:
  `uv venv`
  Then: *Command Palette → Python: Select Interpreter → select .venv/bin/python.*
- uv not found in container
  Rebuild the container: Dev Containers: Rebuild and Reopen in Container
  (post-create.sh installs uv and adds it to PATH)
- Dev Container didn’t run post-create
  Use Dev Containers: Rebuild and Reopen in Container.
- gh not logged in
  `gh auth login`
- new.sh permission denied
  `chmod +x new.sh`

## 5. License (MIT)
You can use, copy, modify, merge, publish, distribute, sublicense, and sell copies of this software, provided you include the copyright and license notice.
The software is provided as is, without warranty of any kind.
See LICENSE for the full text.