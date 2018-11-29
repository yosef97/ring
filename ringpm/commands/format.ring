/*
	Title :	The Ring Package Manager 
	Date  : 2018.11.05
	Author: Mahmoud Fayed <msfclipper@yahoo.com>
*/

func DeleteAllPackages 
	? "RingPM - Format - Delete All Packages"
	# Delete AllPackages.ring 
		oAllPackagesInfo.DeleteAllPackagesFile()
	# Delete Folders 
		aPackages = Dir(cMainPackagesFolder)
		cDir = CurrentDir()
		chdir(cMainPackagesFolder)
		nCount = 0
		for aItem in aPackages 
			if aItem[2] 	# Folder 
				cFolder = aItem[1]	# Folder Name 
				# Because in Linux we have . and .. as folders !
					if cFolder = "." or cFolder = ".." loop ok
				Style("Deleting ",:YellowBlack) ? cFolder 
				OSDeleteFolder(cFolder)
				nCount++
			ok
		next 
		? "Deleted Packages Count : " + nCount
		chdir(cDir)
