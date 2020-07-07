# nginx-build-modules
Bash script to build various nginx modules as dynamic modules. 

This script was originally authored by [whalehub](https://github.com/whalehub). I used it to build some dynamic modules and decided to add more modules to my environment.

#### Current Version 1.19.1 r2
nginx version: 1.19.2
script minor version: r2

## Usage
When a new version of Nginx comes out, the modules need to be updated prior to updating to the new version (if the modules are dynamic). This script aims to automate that. Currently, there are two modules in the script, but of course, it's easy to add more.

## Instructions
1. Clone the repo
2. Run `get-args.sh` 
  * requires docker to be installed and the script to be run as sudo/root
  * From the output copy the text after `configure arguments: ` starting with `--`
3. Paste the build args into the `nginx-build-args` file.
4. Run the `build-nginx-modules.sh script`
5. Install the new nginx version. 
