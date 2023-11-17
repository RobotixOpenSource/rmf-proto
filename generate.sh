#!/bin/bash

# The protoc compiles the proto code to go code. The files will be generated in the following directory
# The folder structure for this repository should be like above. change the username
protoc --go_out=plugins=grpc:/home/anand/go/src/ ./protos/rcc/v1/rcc.proto

# This line is for compiling python files for the rcc.proto file
python3 -m grpc_tools.protoc -I. --python_out=/home/anand/go/src/github.com/RobotixOpenSource/rmf-proto --grpc_python_out=/home/anand/go/src/github.com/RobotixOpenSource/rmf-proto ./protos/rcc/v1/rcc.proto


# This will loop over all the model files and create both go and python files.
for f in ./protos/model/v1/*.proto 
do 
    protoc --go_out=plugins=grpc:/home/anand/go/src/github.com/RobotixOpenSource/rmf-proto $f
    python3 -m grpc_tools.protoc -I. --python_out=/home/anand/go/src/github.com/RobotixOpenSource/rmf-proto --grpc_python_out=/home/anand/go/src/github.com/RobotixOpenSource/rmf-proto $f

    echo "Processing $f file.."
done