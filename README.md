py-uv-dev-template
A ready-to-use Dev Container template for Python + uv.
Spin up consistent, portable dev environments across machines — fast.
1) Prerequisites
Docker Desktop (running)
Visual Studio Code with extensions:
Dev Containers (ms-vscode-remote.remote-containers)
Docker (ms-azuretools.vscode-docker)
Python (ms-python.python)
Pylance (ms-python.vscode-pylance)
Ruff (charliermarsh.ruff)
Black Formatter (ms-python.black-formatter)
Git and GitHub CLI (gh)
Logged into GitHub CLI:
gh auth login
2) Get a local copy of this template
Choose one:
A) GitHub CLI (recommended)
gh repo clone <your-username>/py-uv-dev-template
cd py-uv-dev-template
B) Git over HTTPS
git clone https://github.com/<your-username>/py-uv-dev-template.git
cd py-uv-dev-template
C) Download ZIP
GitHub → Code → Download ZIP
Unzip → open folder in VS Code
If you want to use new.sh, A or B is better.
3) Verify template files
From the repo root, you should have:
.devcontainer/
  devcontainer.json
  Dockerfile
  post-create.sh
.vscode/
  settings.json
  launch.json
src/
  app.py
.gitignore
new.sh
README.md
If new.sh isn’t executable yet:
chmod +x new.sh
4) Create a new project from this template (bootstrap script)
Use new.sh to create a new GitHub repo from this template, clone it locally, and open it in VS Code.
# from the template repo root
./new.sh <project-name> [public|private]
<project-name> = the new repo name on GitHub (required)
Visibility defaults to private if omitted
Examples
./new.sh my-service
./new.sh my-public-service public
What the script does (step-by-step)
Checks your setup
Confirms gh is installed and you’re logged in (gh auth status)
Confirms this template is linked to GitHub (so it can copy from it)
Creates a new GitHub repo
Uses “Create from template” with this repo as the source
Visibility = private by default (or public if specified)
Clones the new repo locally
Runs gh repo clone <owner>/<project-name>
Creates a new local folder named <project-name>
Opens the project in VS Code
Uses the code command if available; otherwise prompts you to open it manually
5) Open and build the Dev Container
Inside your new project:
Reopen in container
VS Code → Command Palette → Dev Containers: Reopen in Container
This builds the Docker image and starts a container using .devcontainer/.
Post-create steps run automatically
.devcontainer/post-create.sh will:
Install uv to ~/.local/bin
Create a .venv in your project
Install ruff and black
If it didn’t run: Dev Containers: Rebuild and Reopen in Container
Ensure the virtual environment exists (idempotent)
uv venv
6) First run (hello world)
Inside the container terminal:
uv --version
python --version
uv run python src/app.py
Expected output:
Hello from Dev Container template!
7) Daily workflow (in a generated project)
Start work
git pull
uv venv
uv pip install <any-new-dependency>
Run
uv run python src/app.py
Lint / Format
(Automatic on save via VS Code settings) or:
ruff check .
black .
Commit & push
git add .
git commit -m "feat: implement X"
git push
8) Alternative: create project via GitHub UI (no script)
On this repo page → Use this template
Name your new repo → choose visibility → Create
Clone it:
gh repo clone <your-user>/<new-repo>
cd <new-repo>
VS Code → Dev Containers: Reopen in Container
Inside container:
uv venv
uv run python src/app.py
9) Troubleshooting
VS Code says “Invalid Python interpreter”
The workspace points to .venv/bin/python. If .venv doesn’t exist yet:
uv venv
Then: Command Palette → Python: Select Interpreter → select .venv/bin/python.
uv not found in container
Rebuild the container: Dev Containers: Rebuild and Reopen in Container
(post-create.sh installs uv and adds it to PATH)
Dev Container didn’t run post-create
Use Dev Containers: Rebuild and Reopen in Container.
gh not logged in
gh auth login
new.sh permission denied
chmod +x new.sh
10) What’s included
.devcontainer/
  devcontainer.json   # VS Code dev container config
  Dockerfile          # Base image (Python 3.12) + build tools
  post-create.sh      # Installs uv, creates .venv, installs ruff/black

.vscode/
  settings.json       # Python/.venv/ruff/format on save
  launch.json         # Debug: run current file

src/
  app.py              # Minimal hello-world script

new.sh                # Bootstrap script to create projects from this template

.gitignore            # Ignore .venv, __pycache__, .vscode, etc.
License (MIT)
You can use, copy, modify, merge, publish, distribute, sublicense, and sell copies of this software, provided you include the copyright and license notice.
The software is provided as is, without warranty of any kind.
See LICENSE for the full text.