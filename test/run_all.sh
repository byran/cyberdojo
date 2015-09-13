#!/bin/bash

.  ./../admin_scripts/setup_docker_volume_mount_runner_env_vars.sh

../languages/refresh_cache.rb
./lib/make_disk_stub_cache.rb

# - - - - - - - - - - - - - - - - - - - - - - - -

modules=( 
  app_helpers 
  app_lib 
  app_models 
#  lib
#  languages
#  integration 
#  app_controllers 
)

echo
for module in ${modules[*]}
do
    echo
    echo "======$module======"  
    cd $module
    ./run_all.sh $*
    cd ..
done
echo
echo

./print_coverage_summary.rb ${modules[*]} | tee test-summary.txt
