FROM             jupyter/all-spark-notebook:latest
MAINTAINER       OtsukaNoboru
#ENV              container docker
#ENV              HTTP_PROXY=${HTTP_PROXY}
#ENV              HTTPS_PROXY=${HTTPS_PROXY}
RUN              pip install awscli
#EXPOSE           80
