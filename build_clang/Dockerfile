FROM fling_build_base
LABEL maintainer="benjamin.hoffman.dev@gmail.com"

# Set compiler to Clang
RUN export CC=/usr/local/bin/clang
RUN export CXX=/usr/local/bin/clang++

# Verifiy which compilers we are using 
RUN which clang
RUN which clang++

RUN cmake . -DCMAKE_C_COMPILER=/usr/bin/clang -DCMAKE_CXX_COMPILER=/usr/bin/clang++ -B ./build
WORKDIR /home/Fling/FlingEngine/build
RUN ls -l

# Build everything
RUN make


# Copy assets and config to the tests folder
RUN cp -r ../Assets ./FlingTests/bin
RUN cp -r ../Config ./FlingTests/bin
WORKDIR /home/Fling/FlingEngine/build/FlingTests/bin/

# Run unit tests
CMD ["./FlingTests"]