FROM golang:1.6.4
ENV APP_1 1.0
RUN groupadd appuser 
RUN useradd appuser -r -s /bin/bash -g appuser
RUN mkdir /appcontainer
COPY ["printnode", "/appcontainer/printnode"]
USER appuser
EXPOSE 8484
CMD whoami
ENTRYPOINT ["/appcontainer/printnode"]
