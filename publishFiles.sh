#! /bin/bash

set -e

./checkEnvironmentVariables.sh

(cd ../gdl-perf/ && rm -rf analyses/ && ./gradlew perfAnalysis)
rm -rf docs/analyses
cp -r ../gdl-perf/analyses docs/

(cd ../alloy && ./gradlew :Alloy:uctCharts :Alloy:uctCharts2)
cp ../alloy/Alloy/abfResultCharts.html docs/
cp -r ../alloy/Alloy/uctViz docs/

git add docs/
git commit -m "Updating website"
git push origin HEAD:master
