FROM openjdk:11

ARG WKHTML_VERSION=0.12.6.1-2
ARG DEB_FILE=/wkhtmltox_${WKHTML_VERSION}.bullseye_amd64.deb

RUN apt update -y \
 && apt install -y libjpeg62-turbo libx11-6 libxcb1 libxext6 libxrender1 xfonts-75dpi xfonts-base \
 && apt clean \
 && rm -rf /var/lib/apt/lists/* \
 && wget -q https://github.com/wkhtmltopdf/packaging/releases/download/${WKHTML_VERSION}/${DEB_FILE} \
 && dpkg -i ${DEB_FILE} \
 && rm ${DEB_FILE}

WORKDIR /emailconverter

COPY ./emailconverter.jar ./emailconverter.jar

COPY ./convert_email ./
RUN chmod a+rx convert_email

ENTRYPOINT [ "./convert_email" ]
CMD [ "/source", "/target" ]
