FROM ppc64le/ubuntu:16.04
RUN apt-get update
RUN apt-get install wget
RUN wget https://developer.nvidia.com/compute/cuda/8.0/prod/local_installers/cuda-repo-ubuntu1604-8-0-local_8.0.44-1_ppc64el-deb
RUN wget https://developer.nvidia.com/compute/cuda/8.0/Prod2/patches/2/cuda-repo-ubuntu1604-8-0-local-cublas-performance-update_8.0.61-1_ppc64el-deb
RUN wget https://developer.nvidia.com/compute/cuda/8.0/Prod2/local_installers/cuda-repo-ubuntu1604-8-0-local-ga2v2_8.0.61-1_ppc64el-deb
RUN dpkg -i cuda-repo-ubuntu1604-8-0-local-ga2v2_8.0.61-1_ppc64el-deb
RUN dpkg -i cuda-repo-ubuntu1604-8-0-local_8.0.44-1_ppc64el-deb
RUN apt-get update
RUN apt-get install cuda
RUN dpkg -i cuda-repo-ubuntu1604-8-0-local-cublas-performance-update_8.0.61-1_ppc64el-deb

RUN apt-get update

RUN apt install docker.io
RUN git clone https://github.com/NVIDIA/nvidia-docker.git
RUN cd nvidia-docker/
RUN git checkout ppc64le
RUN git branch -a
RUN make deb
RUN cd dist/
RUN dpkg -i --force-all nvidia-docker_1.0.1-1_ppc64el.deb
