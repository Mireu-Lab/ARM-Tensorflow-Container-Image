FROM arm64v8/python:3.9-slim

RUN apt-get update &&\
        apt-get upgrade -y

RUN apt-get install -y\
        gfortran\
        libopenblas-dev\
        liblapack-dev\
        libhdf5-dev

ADD tensorflow-2.8.0-cp39-cp39-linux_aarch64.whl .
RUN pip3 install tensorflow-2.8.0-cp39-cp39-linux_aarch64.whl    
RUN pip3 uninstall protobuf -y &&\
	pip3 install --upgrade "protobuf<=3.20.1"

CMD ["/bin/bash"]
