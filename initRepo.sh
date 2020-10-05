# Script for Initializing a Unity Repository
# This Script can be used to Clean a Unity Repository 
# Make sure you have setup a .gitignore properly so it won't break your project
# Check gitignore.sample to see the .gitignore used by this script when Initializing a new repo

repo=$1
if [[ "$repo" == "-clean" ]] ; then
   clean=$1
   repo=$2
else
   clean=$2
fi

if [ -z $repo ] ; then
   echo "You need to specify the repository foler."
   echo "Usage: "
   echo "    $0 RepoFolder [-clean]"
   exit 1
fi

if [ ! -d $repo ] ; then
   echo "Folder $repo doesn't exists"
   exit 2 
fi

if [ -d $repo/.git ] ; then
   echo "There's a repository present on $repo."

   if [ ! -f $repo/.gitignore ] ; then
      echo "There's no .gitignore file present. Proceeding to add and commit changes..."
      cp gitignore.sample $repo/.gitignore
      cd $repo
      git add .gitignore
      git commit -m "Add .gitignore for Unity project files."
      git status
   fi

   if [[ "$clean" == "-clean" ]] ; then
      echo "Clean option specified -- cleaning the repository..."
      cd $repo
      git clean -Xfd
   fi

   exit 0
fi 

if [ -f $repo/.gitignore ] ; then
   echo ".gitignore already exists, not replacing"
else
   cp gitignore.sample $repo/.gitignore
fi

cd $repo
git init
git add .gitignore
git add * 
git commit -m "Initial Commit"
git status
if [[ "$clean" == "-clean" ]] ; then
   echo "Cleaning the Repository..."
   git clean -Xfd
fi
