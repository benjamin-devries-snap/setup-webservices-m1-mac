# setup-webservices-m1-mac

Setting up cs-webservices-local-docker for use with M1 chip Mac

## INSTRUCTIONS FOR USE

1. Make a branch of cs-webservices-local-docker
2. Copy the file "webservices_m1.sh" into the home directory of webservices
3. Run `sudo chmod +x webservices_m1.sh` to give this script permission to execute
4. Use `./webservices_m1.sh` to run
5. You may then remove this file after execution, and git commit your changes

To use webservices, see:
[cs-webservices-local-docker README](https://github.com/control4/cs-webservices-local-docker/blob/develop/README.md)

## IMPORTANT NOTES

DON'T auto format the script or the indentation will mess things up

If are still running into issues, replace everywhere in this file that says "openjdk:17" with "openjdk:17-jdk-bullseye"
