import os
from pathlib import Path

def updateAll(comment):

	currentDir=Path.cwd()
	pathObj = Path(currentDir)

	for childDir in pathObj.iterdir():
		os.system('cd '+str(childDir))
		os.system('git add ./*')
		os.system('git commit -m '+comment+' | git push')
		os.system('cd ../')

def moveToRemoteRepo():
	os.system('sudo fdisk -l | grep sd')
	os.system('df -h')
	remoteRepoPath=input("enter remote repo path : ")
	os.system('sudo cd '+remoteRepoPath)
	os.system('pwd')
	return remoteRepoPath

def makeRemoteRepo():
	remoteRepoPath = moveToRemoteRepo()
	repoName=input("enter new repo name : ")
	os.system('sudo mkdir'+repoName+'.git  | git init --bare ./'+repoName+'.git')
	makeLocalRepo(remoteRepoPath,repoName)

def makeLocalRepo(remoteRepoPath,repoName):
	mode = input("clone or make? : ")
	dirPath = input("local repo's parent directory path : ")
	os.system('sudo cd '+dirPath)
	os.system('pwd')
	protocol=selectProtocol()

	if mode == "clone":
		os.system('git clone '+protocol+remoteRepoPath)
	elif mode == "make":
		os.system('sudo mkdir '+repoName)
		os.system('cd '+repoName)
		os.system('git init | git add ./* | git commit -m "initialize"')

	os.system('git remote add origin '+protocol+remoteRepoPath)
	os.system('git remote -v')
	os.system('git push --set-upstream origin master')

def selectProtocol():
	select = input("""
what protocol?

1. ssh://user@host.com
2. git://host.com
3. https://host.com
4. file://

select number (1~4) :
""")
	if select == '1':
		user = input("enter user account : ")
		address = input("enter host domain name : ")
		return "ssh://"+user+"@"+address
	elif select == '2':
		address = input('enter host domain name : ')
		return "git://"+address
	elif select == '3':
		address = input('enter host domain name : ')
		return "https://"+address
	elif select == '4':
		return "file://"


if __name__ == '__main__':

#	makeRemoteRepo()
	comment = input("enter git comment : ")
	updateAll(comment)

