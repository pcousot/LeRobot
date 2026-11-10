#!/bin/zsh
# fabriquer.sh : construit ../../LeRobotPython.app (droplet AppleScript)
# a partir de LeRobotPython.applescript, de lancer.sh et de l'icone du
# robot de la version OCaml.
cd ${0:A:h}
app=../../LeRobotPython.app
rm -rf $app
osacompile -o $app LeRobotPython.applescript || exit 1
cp lancer.sh $app/Contents/Resources/
icone=../../../LeRobot_OCaml_FR/LeRobotOCaml.app/Contents/Resources/droplet.icns
[ -f $icone ] && cp $icone $app/Contents/Resources/droplet.icns
p=$app/Contents/Info.plist
plutil -replace CFBundleIdentifier -string fr.cousot.lerobotpython $p
plutil -replace CFBundleName -string LeRobotPython $p
# l'icone du robot (droplet.icns) et non celle d'osacompile (Assets.car)
plutil -remove CFBundleIconName $p 2>/dev/null
rm -f $app/Contents/Resources/Assets.car
# n'accepter que les fichiers (comme l'application OCaml)
plutil -replace OSAAppletShowStartupScreen -bool false $p
codesign --force --deep -s - $app 2>/dev/null
touch $app
echo "$app construite"
