FROM nvidia/cuda:11.3.1-cudnn8-devel-ubuntu20.04 
ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8
ENV PATH=/opt/miniconda3/bin:$PATH
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV PYTHONIOENCODING=UTF-8
ENV PIPENV_VENV_IN_PROJECT=1
ENV JCC_JDK=/usr/lib/jvm/java-8-openjdk-amd64
RUN USE_CUDA=1
RUN CUDA_VERSION=11.3.1
RUN CUDNN_VERSION=8
RUN LINUX_DISTRO=ubuntu
RUN DISTRO_VERSION=20.04
RUN TORCH_CUDA_ARCH_LIST="7.0 7.5 8.0 8.6"
RUN rm -f /etc/apt/apt.conf.d/docker-clean; \
echo 'Binary::apt::APT::Keep-Downloaded-Packages "true";' \
> /etc/apt/apt.conf.d/keep-cache
RUN apt-get update && DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get -y install tzdata && apt-get install -y --no-install-recommends \
build-essential \
ca-certificates \
ccache \
curl \
git \
wget \
cmake \
openjdk-8-jdk \
libaio-dev \
llvm-10 lldb-10 llvm-10-dev libllvm10 llvm-10-runtime \
libgmp-dev libcgal-dev libboost-all-dev \
libglu1-mesa-dev freeglut3-dev mesa-common-dev \
qt5-default libqt5opengl5 libqt5opengl5-dev \
libopengl0 \
libeigen3-dev \
&& rm -rf /var/lib/apt/lists/*

ENV PYTHON_VERSION=3.8
ENV CONDA_URL=https://repo.anaconda.com/miniconda/Miniconda3-py38_4.10.3-Linux-x86_64.sh
RUN curl -fsSL -v -o ~/miniconda.sh -O ${CONDA_URL} && \
chmod +x ~/miniconda.sh && \
~/miniconda.sh -b -p /opt/miniconda3 

WORKDIR /app
COPY environment.yml .
COPY CBSI.tar.gz .
RUN tar -xf CBSI.tar.gz
RUN mkdir niftyreg-build
ENV CMAKE_BUILD_TYPE=Release
WORKDIR /app/niftyreg-build
RUN cmake ../niftyreg-CBSI
RUN make
RUN make install
WORKDIR /app
RUN conda env create -f environment.yml
SHELL ["conda", "run", "-n", "vox2cortex", "/bin/bash", "-c"]
RUN pip install jcc==3.12
RUN git clone https://github.com/neuroneural/Vox2Cortex_fork.git
WORKDIR /app/Vox2Cortex_fork/docker/nighres
RUN ./build.sh
RUN python3 -m pip install .
RUN pip install https://github.com/cnr-isti-vclab/PyMeshLab/releases/download/v2021.07/pymeshlab-2021.7-cp37-cp37m-manylinux1_x86_64.whl
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*
RUN rm -rf /app
RUN pip cache purge
RUN conda clean -a
ENTRYPOINT ["/bin/bash"]
