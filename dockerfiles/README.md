# BE CAREFUL!! STRICT RULE TO EXEXUTE
1. contextDir
docker file context must be a directory. please copy proper files from path below.
- (.sh) : ../bash
- (.list) : ../configFiles

2. Dockerfile
- must be located in contextDir/Dockerfile
- filename must be a "Dockerfile"

3. build command
running the following command from the directory where the Dockerfile is located.
```
docker build --tag "imagename:tag" contextDir
```

4. check image
```
docker images
```

5. change image tag
```
docker image tag oldImageName:tag newImageName:tag
```
imageName:tag would not get set when there is an error in the build.

6. installation
- interactive shell will cause error : must put -y option on package installation
- correct misspelling
- when use ADD command, all files must be in the dockerfile context dir
- change user at final
