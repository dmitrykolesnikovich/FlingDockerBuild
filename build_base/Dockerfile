FROM ubuntu
LABEL maintainer="benjamin.hoffman.dev@gmail.com"

# Install all programs that are necessary
RUN apt-get update
RUN apt-get install tar -y
RUN apt-get install wget -y
RUN apt-get install build-essential -y
RUN apt-get install clang gcc g++ git -y
RUN apt-get install -y vim
RUN apt-get install -y cppcheck

# Install Cmake
RUN wget -qO- "https://cmake.org/files/v3.13/cmake-3.13.4-Linux-x86_64.tar.gz" | tar --strip-components=1 -xz -C /usr/local
# GLM and GLFW
RUN apt-get install -y libglm-dev libxcb-dri3-0 libxcb-present0
RUN apt-get install -y libpciaccess0 libpng-dev libxcb-keysyms1-dev
RUN apt-get install -y libxcb-dri3-dev libx11-dev libmirclient-dev
RUN apt-get install -y libwayland-dev libxrandr-dev
RUN apt-get install -y libglfw3-dev
RUN apt-get install -y xorg-dev

## Vulkan SDK
RUN wget -O VulkanSDK.tar.gz https://sdk.lunarg.com/sdk/download/1.1.92.1/linux/vulkansdk-linux-x86_64-1.1.92.1.tar.gz?u=true && \
    mkdir VulkanSDK && \
    cd VulkanSDK && \
    tar xvf /VulkanSDK.tar.gz

RUN	cd VulkanSDK/1.1.92.1
ENV	VULKAN_SDK="/VulkanSDK/1.1.92.1/x86_64:${VULKAN_SDK}"
ENV	PATH="${VULKAN_SDK}/bin:${PATH}"
ENV	LD_LIBRARY_PATH="${VULKAN_SDK}/lib:${LD_LIBRARY_PATH}"
ENV	VK_LAYER_PATH="${VULKAN_SDK}/etc/explicit_layer.d:${VK_LAYER_PATH}"

### Download the engine
RUN mkdir /home/Fling
WORKDIR /home/Fling

RUN git clone https://github.com/flingengine/FlingEngine.git
WORKDIR /home/Fling/FlingEngine
RUN git pull

RUN git submodule update --init --recursive
RUN mkdir build -p

WORKDIR /home/Fling/FlingEngine
