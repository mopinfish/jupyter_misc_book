FROM             jupyter/all-spark-notebook:latest
MAINTAINER       OtsukaNoboru
#ENV              container docker
#ENV              HTTP_PROXY=${HTTP_PROXY}
#ENV              HTTPS_PROXY=${HTTPS_PROXY}
#RUN              pip install awscli
RUN              pip install jupyter_contrib_nbextensions
#RUN              jupyter contrib nbextension install
#RUN              jupyter contrib nbextensions migrate
# install coursier and almond for scala  @see https://x1.inkenkun.com/archives/5871
ENV              SCALA_VERSION=2.12.7
ENV              ALMOND_VERSION=0.1.10
RUN              curl -L -o coursier https://git.io/coursier 
RUN              chmod +x coursier
RUN              ./coursier bootstrap -i user -I user:sh.almond:scala-kernel-api_$SCALA_VERSION:$ALMOND_VERSION sh.almond:scala-kernel_$SCALA_VERSION:$ALMOND_VERSION -o almond
RUN              ./almond --install --force
# install octave kernel
USER             root
RUN              apt update
RUN              apt upgrade -y
RUN              apt install -y octave
RUN              pip install octave-kernel
RUN              apt install -y graphviz
RUN              apt install -y libgraphviz-dev
RUN              pip install pygraphviz
RUN              pip install pandas-profiling
RUN              conda install -c conda-forge lightgbm
#EXPOSE           80
