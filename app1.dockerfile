############App_1 

FROM alpine:3.5
MAINTAINER Team Ed and Magdalena
ENV APP_1 1.0
RUN groupadd appuser && \ 
    useradd appuser -r -s appuser appuser
COPY ["printnode", "/appcontainer/printnode"]
USER appuser
EXPOSE 8484
ENTRYPOINT["/appcontainer/printnode"]
