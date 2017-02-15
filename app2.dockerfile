############App_2

FROM alpine:3.5
MAINTAINER Team Ed and Magdalena
ENV APP_2 1.0
RUN groupadd appuser && \ 
    useradd appuser -r -s appuser appuser
COPY ["printnode", "/appcontainer/printnode"]
USER appuser
EXPOSE 8484
ENTRYPOINT["/appcontainer/printnode"]
