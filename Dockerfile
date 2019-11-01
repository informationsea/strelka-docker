FROM alpine:3.10 AS build
RUN apk add curl bzip2 bash gcc g++ libc-dev make cmake boost-dev boost-static zlib-dev
WORKDIR /workspace
RUN curl -OL https://github.com/Illumina/strelka/releases/download/v2.9.10/strelka-2.9.10.release_src.tar.bz2
RUN tar xjf strelka-2.9.10.release_src.tar.bz2
WORKDIR /workspace/build
RUN cmake ../strelka-2.9.10.release_src && make
RUN make install

FROM alpine:3.10
RUN apk add --no-cache bash zlib python2
COPY --from=build /usr/local /usr/local
