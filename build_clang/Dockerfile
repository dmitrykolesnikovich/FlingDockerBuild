FROM fling_build_base
LABEL maintainer="benjamin.hoffman.dev@gmail.com"

# Set compiler to Clang
RUN export CC=/usr/local/bin/clang
RUN export CXX=/usr/local/bin/clang++

# Verifiy which compilers we are using 
RUN which clang
RUN which clang++
RUN clang --version
RUN clang++ --version

# Checkout the branch specified if we wanna
RUN git checkout ${DEV_BRANCH}
RUN git branch

RUN cmake . -DCMAKE_C_COMPILER=/usr/bin/clang -DCMAKE_CXX_COMPILER=/usr/bin/clang++ -B ./build
WORKDIR /home/Fling/FlingEngine/build
RUN ls -l

# Build everything
RUN make

# Run unit tests
#CMD ["./FlingTests/bin/FlingTests"]
