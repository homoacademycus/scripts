#!/bin/python

import os
import datetime
"""
manage existing server images
"""

while(True):
	sel = input("""

	1. 서버의 지금 모습을 이미지로 저장하기
	2. 이미지를 압축파일로 저장하기
	3. 압축파일을 이미지로 읽어들이기
	4. 이미지 삭제하기
	5. 서버 모두 삭제하기
	6. 끝내기

	--> 숫자를 입력하세요(1~5) : """)
	if sel == '1':
		os.system("docker ps -a")
		containerID=input("\n저장할 서버의 CONTAINER ID를 입력하세요: ")
		imagename=input("새 이미지명을 입력하세요: ")
		os.system("docker commit "+containerID+" "+imagename+":"+datetime.date.today().strftime("%m%d"))
		print("서버를 이미지로 저장하였습니다..")

	elif sel == '2':
		os.system("docker images")
		name = input("\n압축파일로 저장할 이미지명을 입력하세요: ")
		os.system("docker save "+name+" | gzip -c 1> ./images/"+name+".tgz")
		print("이미지를 압축파일로 저장하였습니다..")

	elif sel == '3':
		os.system('ls ./images')
		imagefilename = input("\n불러올 파일명을 입력하세요: ")
		os.system("gunzip -c ./images/"+imagefilename+" | docker load")
		print("압축파일을 이미지로 불러왔습니다..")

	elif sel == '4':
		os.system("docker images")
		imagename = input("\n삭제할 이미지명 또는 이미지ID를 입력하세요: ")
		os.system("docker rmi "+imagename)
		print("이미지를 삭제합니다...")

	elif sel == '5':
		print("서버를 모두 멈추고, 삭제합니다..")
		os.system('docker container stop $(docker ps -aq)')
		os.system('docker container rm $(docker ps -aq)')

	elif sel == '6':		
		print("프로그램을 마칩니다..")
		break

	else:
		print("잘못 입력했습니다. 다시 입력해주세요..")

