#! /bin/bash

set -e

./checkEnvironmentVariables.sh

rm -rf docs/analyses
cp -r ../gdl-perf/analyses docs/

(cd ../alloy && ./gradlew :Alloy:uctCharts :Alloy:uctCharts2)
cp ../alloy/Alloy/abfResultCharts.html docs/
cp -r ../alloy/Alloy/uctViz docs/
