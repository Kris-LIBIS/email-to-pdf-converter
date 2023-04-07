FROM openjdk:11

ARG WKHTML_VERSION=0.12.6.1-2

RUN apt-get update -qqqy \
 && export DEBIAN_FRONTEND=noninteractive \
 && apt-get install -qqqy --no-install-recommends libjpeg62-turbo libx11-6 libxcb1 libxext6 libxrender1 xfonts-75dpi xfonts-base 2>&1 \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN wget -q https://github.com/wkhtmltopdf/packaging/releases/download/${WKHTML_VERSION}/wkhtmltox_${WKHTML_VERSION}.bullseye_amd64.deb \
 && dpkg -i wkhtmltox_${WKHTML_VERSION}.bullseye_amd64.deb \
 && rm wkhtmltox_${WKHTML_VERSION}.bullseye_amd64.deb

WORKDIR /emailconverter

COPY ./emailconverter.jar ./emailconverter.jar

COPY ./convert_email ./
RUN chmod a+rx convert_email

COPY ./wait ./
RUN chmod a+rx wait

ENTRYPOINT [ "./convert_email" ]
