#! /bin/bash

set -e

./checkEnvironmentVariables.sh

(cd ../gdl-perf/ && rm -rf analyses/ && ./gradlew perfAnalysis --no-daemon)
rm -rf docs/analyses
cp -r ../gdl-perf/analyses docs/

# (cd ../alloy && ./gradlew :Alloy:uctCharts)
# (cd ../alloy && ./gradlew :Alloy:uctCharts2)
# cp ../alloy/Alloy/abfResultCharts.html docs/
# cp -r ../alloy/Alloy/uctViz docs/

(cd ../game-ai-research && ./gradlew writeReports --no-daemon)
cp -r ../game-ai-research/reports docs/

git add docs/
git commit -m "Updating website"
git push origin HEAD:master
