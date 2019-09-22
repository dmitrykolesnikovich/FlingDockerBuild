FROM fling_build_base
LABEL maintainer="benjamin.hoffman.dev@gmail.com"

# Set compiler to GCC
RUN export CC=/usr/local/bin/gcc
RUN export CXX=/usr/local/bin/g++

# Verifiy which compilers we are using 
RUN which gcc
RUN which g++
RUN gcc --version
RUN g++ --version

RUN cmake . -DCMAKE_C_COMPILER=/usr/bin/gcc -DCMAKE_CXX_COMPILER=/usr/bin/g++ -B ./build
WORKDIR /home/Fling/FlingEngine/build
RUN ls -l

# Build everything
RUN make
