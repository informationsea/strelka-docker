FROM centos:6
RUN curl -OL https://github.com/Illumina/strelka/releases/download/v2.9.10/strelka-2.9.10.centos6_x86_64.tar.bz2 && \
    tar xjf strelka-2.9.10.centos6_x86_64.tar.bz2 &&\
    rm strelka-2.9.10.centos6_x86_64.tar.bz2
ENV PATH=/strelka-2.9.10.centos6_x86_64/bin:${PATH}
ADD run.sh /
ENTRYPOINT [ "/bin/bash", "/run.sh" ]