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

echo "Clean = $clean"
echo "Repo  = $repo"

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

   if [[ "$clean" == "-clean" ]] ; then
      echo "Clean option specified -- cleaning the repository..."
      cd $repo
      git clean -Xfd
      exit 0
   else
      exit 3
   fi
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
