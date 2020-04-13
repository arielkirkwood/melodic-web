#!/usr/bin/env bash
#
# Usage
# ---------------

# 1. Clone second version of Melodic in sibling directory named `mel-docs`.
#X 2. Within `mel-docs` copy, switch to `gh-pages` branch.
#X 3. Pull latest, re-bundle, re-npm.
#  4. Run script from the original `melodic-web` repo.
# build/ship.sh 1.0.0beta

red=$'\e[1;31m'
green=$'\e[1;32m'
blue=$'\e[1;34m'
magenta=$'\e[1;35m'
cyan=$'\e[1;36m'
end=$'\e[0m'

# Get current version from package.json
current_version=$(node -p "require('./package.json').version")


if [[ $# -lt 1 ]]; then
  printf "\n${red}⚠️  Shipping aborted. You must specify a version.\n${end}"
  exit 1
fi


# Get root directory and cd to it
root_dir=$(git rev-parse --show-toplevel)
cd $root_dir

# Just in case
bundle install
yarn install

# Make the docs sub-repo
git_url=$(git remote get-url origin)
rm -rf _site
mkdir -p _site
cd _site
echo $git_url
git clone "$git_url"

# Check out gh-pages branch
cd melodic-web
git checkout gh-pages
cd "$root_dir"

# Pull latest changes, just to be sure
printf "\n${magenta}=======================================================${end}"
printf "\n${magenta}Pulling latest changes...${end}"
printf "\n${magenta}=======================================================\n\n${end}"
git pull origin v1-dev

# Update version number
printf "\n${magenta}=======================================================${end}"
printf "\n${magenta}Updating version number...${end}"
printf "\n${magenta}=======================================================\n${end}"
npm run release-version $current_version $1

# Compile latest CSS and JS
printf "\n${magenta}=======================================================${end}"
printf "\n${magenta}Compiling latest CSS and JS...${end}"
printf "\n${magenta}=======================================================\n${end}"
npm run dist

# Generate the SRI hashes
printf "\n${magenta}=======================================================${end}"
printf "\n${magenta}Generating the SRI hashes...${end}"
printf "\n${magenta}=======================================================\n${end}"
npm run release-sri

# Compress the dist files
printf "\n${magenta}=======================================================${end}"
printf "\n${magenta}Compressing the dist files...${end}"
printf "\n${magenta}=======================================================\n${end}"
npm run release-zip

# Compile the docs (to _gh_pages)
printf "\n${magenta}=======================================================${end}"
printf "\n${magenta}Compiling hosted documentation...${end}"
printf "\n${magenta}=======================================================\n${end}"
npm run docs-github

# Copy the contents of the built docs site over to the docs sub-repo
printf "\n${magenta}=======================================================${end}"
printf "\n${magenta}Copying it over to the gh-pages branch...${end}"
printf "\n${magenta}=======================================================\n${end}"
cp -rf _gh_pages/. _site/melodic-web
printf "\nDone!\n"

printf "\n${green}=======================================================${end}"
printf "\n${green}Success, $1 is ready to review and publish.${end}"
printf "\n${green}=======================================================\n\n${end}"
