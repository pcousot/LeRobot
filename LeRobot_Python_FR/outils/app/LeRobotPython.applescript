-- LeRobotPython
--   double-clic sur l'icone : lance Dessiner.py (dessin interactif) ;
--   deposer un programme Python (.py) sur l'icone : l'execute dans la
--   fenetre du robot (comme ./robot.sh), dans une fenetre du Terminal.
-- (Pas de XQuartz : la fenetre du robot est une fenetre tkinter.)

on run
	set script_robot to my trouverRobotSh()
	if script_robot is "" then return
	set dessiner to (do shell script "dirname " & quoted form of script_robot) & "/Dessiner.py"
	my executer(script_robot, dessiner)
end run

on open fichiers
	set script_robot to my trouverRobotSh()
	if script_robot is "" then return
	repeat with f in fichiers
		set chemin to POSIX path of f
		if chemin ends with ".py" then
			my executer(script_robot, chemin)
		else
			display alert "LeRobotPython" message (chemin & " n'est pas un programme Python (.py).") as warning
		end if
	end repeat
end open

-- execute le programme chemin dans une fenetre du Terminal
on executer(script_robot, chemin)
	try
		set lanceur to POSIX path of (path to resource "lancer.sh")
		-- lire robot.sh et le programme ici, pendant que l'application
		-- tourne : macOS attribue a l'application l'acces au Bureau du
		-- programme lance dans le Terminal, et ne peut demander
		-- l'autorisation qu'a une application ouverte
		do shell script "cat " & quoted form of script_robot & " " & quoted form of chemin & " >/dev/null; ls " & quoted form of (do shell script "dirname " & quoted form of chemin) & " >/dev/null"
		tell application "Terminal"
			activate
			-- fin normale (Echap, code 0) : lancer.sh ferme la fenetre du
			-- Terminal ; en cas d'erreur elle reste ouverte
			do script "clear; " & quoted form of lanceur & " " & quoted form of script_robot & " " & quoted form of chemin & " && exit"
		end tell
	on error msg
		display alert "LeRobotPython" message msg as critical
	end try
end executer

on trouverRobotSh()
	set ici to POSIX path of ((path to me as text) & "::")
	-- robot.sh est a cote de l\'application, ou que soit le dossier LeRobot
	set candidats to {ici & "robot.sh"}
	repeat with c in candidats
		try
			do shell script "test -x " & quoted form of (c as text)
			return c as text
		end try
	end repeat
	display alert "LeRobotPython" message "Le fichier robot.sh est introuvable. L'application doit rester dans le dossier LeRobot_Python_FR, a cote de robot.sh." as critical
	return ""
end trouverRobotSh
