-- LeRobotPythonEN
--   double-click the icon: runs Draw.py (interactive drawing);
--   drop a Python program (.py) on the icon: runs it in the robot's window
--   (like ./robot.sh), in a Terminal window.
-- (No XQuartz: the robot's window is a tkinter window.)

on run
	set robot_script to my findRobotSh()
	if robot_script is "" then return
	set draw to (do shell script "dirname " & quoted form of robot_script) & "/Draw.py"
	my runProgram(robot_script, draw)
end run

on open theFiles
	set robot_script to my findRobotSh()
	if robot_script is "" then return
	repeat with f in theFiles
		set thePath to POSIX path of f
		if thePath ends with ".py" then
			my runProgram(robot_script, thePath)
		else
			display alert "LeRobotPythonEN" message (thePath & " is not a Python program (.py).") as warning
		end if
	end repeat
end open

-- runs the program thePath in a Terminal window
on runProgram(robot_script, thePath)
	try
		set launcher to POSIX path of (path to resource "launch.sh")
		-- read robot.sh and the program here, while the application is
		-- running: macOS gives the application the access to the folder of
		-- the program run in the Terminal, and can only ask an open
		-- application for permission
		do shell script "cat " & quoted form of robot_script & " " & quoted form of thePath & " >/dev/null; ls " & quoted form of (do shell script "dirname " & quoted form of thePath) & " >/dev/null"
		tell application "Terminal"
			activate
			-- normal end (Esc, code 0): launch.sh closes the Terminal
			-- window; after an error it stays open
			do script "clear; " & quoted form of launcher & " " & quoted form of robot_script & " " & quoted form of thePath & " && exit"
		end tell
	on error msg
		display alert "LeRobotPythonEN" message msg as critical
	end try
end runProgram

on findRobotSh()
	set here to POSIX path of ((path to me as text) & "::")
	-- robot.sh is next to the application, wherever the LeRobot folder is
	set candidates to {here & "robot.sh"}
	repeat with c in candidates
		try
			do shell script "test -x " & quoted form of (c as text)
			return c as text
		end try
	end repeat
	display alert "LeRobotPythonEN" message "The file robot.sh cannot be found. The application must stay in the folder LeRobot_Python_EN, next to robot.sh." as critical
	return ""
end findRobotSh
