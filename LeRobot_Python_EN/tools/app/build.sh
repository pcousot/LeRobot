#!/bin/zsh
# build.sh: builds ../../LeRobotPythonEN.app (AppleScript droplet) from
# LeRobotPythonEN.applescript, launch.sh and the robot's icon of the OCaml
# version.
cd ${0:A:h}
app=../../LeRobotPythonEN.app
rm -rf $app
osacompile -o $app LeRobotPythonEN.applescript || exit 1
cp launch.sh $app/Contents/Resources/
icon=../../../LeRobot_OCaml_FR/LeRobotOCaml.app/Contents/Resources/droplet.icns
[ -f $icon ] && cp $icon $app/Contents/Resources/droplet.icns
p=$app/Contents/Info.plist
plutil -replace CFBundleIdentifier -string fr.cousot.lerobotpythonen $p
plutil -replace CFBundleName -string LeRobotPythonEN $p
# the robot's icon (droplet.icns) and not osacompile's (Assets.car)
plutil -remove CFBundleIconName $p 2>/dev/null
rm -f $app/Contents/Resources/Assets.car
# accept only files (like the OCaml application)
plutil -replace OSAAppletShowStartupScreen -bool false $p
codesign --force --deep -s - $app 2>/dev/null
touch $app
echo "$app built"
