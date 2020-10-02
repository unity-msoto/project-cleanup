# Unity Project Cleanup using Git

## Description

### A simple script for setting up a repository for your unity project that will let you:
* Keep track of your work and do proper versioning of your project (git usual purpose).
* Easily clean your project for archiving or transfer to another media.

#### Cleanup is accomplished by using the *git clean* command inside your repo. More details can be seen below.

**Requisite**: Make sure you have git installed in your system before going forward.

## Usage

#### For macOS/Linux users this repo contains the script called initrepo.sh which will let you initialize your existing projects into a git repository, and optionally clean it (remove all/most files that can be rebuilt by compiling your project).

#### Just Initialize:
```
# Initialize Project on folder MyProjectFolder with a git repository with a proper .gitignore
./initrepo.sh MyProjectFolder
```

#### Initialize & Clean:
```
# Is a good practice to backup your project before doing a cleanup just in case
# Initialize a git repository an also clean the project
./initrepo.sh MyProjectFolder -clean
```

## The Stuff that matters

#### You can manually do this by just copying the file *.gitignore.sample* (rename it to *.gitignore*)to your project folder and executing the following commands:

```
git init
git add .gitignore
git add *
git clean -Xdf
```
