FROM fling_build_base
LABEL maintainer="benjamin.hoffman.dev@gmail.com"

# Set compiler to GCC
RUN export CC=/usr/local/bin/gcc
RUN export CXX=/usr/local/bin/g++

# Verifiy which compilers we are using 
RUN which gcc
RUN which g++

RUN cmake . -DCMAKE_C_COMPILER=/usr/bin/gcc -DCMAKE_CXX_COMPILER=/usr/bin/g++ -B ./build
WORKDIR /home/Fling/FlingEngine/build
RUN ls -l

# Build everything
RUN make

RUN ls -l

# Copy assets and config to the tests folder
RUN cp -r ../Assets ./FlingTests/bin
RUN cp -r ../Config ./FlingTests/bin
WORKDIR /home/Fling/FlingEngine/build/FlingTests/bin/

# Run unit tests
CMD ["./FlingTests"]