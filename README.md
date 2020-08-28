# nginx-build-modules
Bash script to build various nginx modules as dynamic modules. 

This script was originally authored by [whalehub](https://github.com/whalehub). I used it to build some dynamic modules and I plan to add more in the future.

#### Current Version 1.19.2-r1
nginx version: 1.19.2  
script minor version: r1

## Usage
When a new version of Nginx comes out, the modules need to be updated prior to updating to the new version (if the modules are dynamic). This script aims to automate that. Currently, there are two modules in the script, but of course, it's easy to add more.

## Instructions
1. Clone the repo
2. Run the `build-modules.sh script`
3. Install the new nginx version. 
