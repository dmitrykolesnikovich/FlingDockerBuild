FROM fling_build_base
LABEL maintainer="benjamin.hoffman.dev@gmail.com"

# TODO Args for output file
RUN apt-get install -y cppcheck

# Set compiler to GCC
RUN export CC=/usr/local/bin/gcc
RUN export CXX=/usr/local/bin/g++

# Checkout the branch specified if we wanna
RUN git checkout ${DEV_BRANCH}
RUN git branch

# Put myself in the right directory
WORKDIR /home/Fling/FlingEngine/StaticAnalysis
RUN ls -l

# Run unit tests
CMD ["./run-cpp-check.sh"]
