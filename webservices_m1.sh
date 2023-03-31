#!/bin/bash

echo Setting up webservices...

# Update Dockerfiles to point to openjdk:17
for d in */
do
    if test -f "$d"Dockerfile
    then
        if grep -q '489561981168.dkr.ecr.us-east-1.amazonaws.com/boot-base:latest' "$d"Dockerfile; then
            echo fixing "$d"Dockerfile...
        fi
        sed -i '' "s/489561981168.dkr.ecr.us-east-1.amazonaws.com\/boot-base:latest/openjdk:17/g" "$d"Dockerfile
    fi
done

# Update docker-compose.yml to use linux x86 platform
if ! grep -q 'platform: linux/x86_64' 'docker-compose.yml'; then
    sed -i '' '/connection-manager-db:/a\
    platform: linux/x86_64
' docker-compose.yml;
    sed -i '' '/certificate-db:/a\
    platform: linux/x86_64
' docker-compose.yml;
    echo Updating docker-compose.yml for correct MySQL platform...;
fi

# Update docker-compose.yml security16 image
if grep -q '489561981168.dkr.ecr.us-east-1.amazonaws.com/security_16_test:2.7' 'docker-compose.yml'; then
    echo Updating docker-compose.yml for correct security 16 image...
fi
sed -i '' 's/489561981168.dkr.ecr.us-east-1.amazonaws.com\/security_16_test:2.7/489561981168.dkr.ecr.us-east-1.amazonaws.com\/security_16_arm:1.2/g' 'docker-compose.yml'

# Add flyway.env file if missing
if ! test -f "flyway.env"; then
    echo; read -p 'Enter SPRING_FLYWAY_LICENSE_KEY: ' key; echo
    echo "SPRING_FLYWAY_LICENSE_KEY=$key" > flyway.env
    echo -e 'Created flyway.env file!\n\nDone setting up!'
else
    echo Done setting up!
fi