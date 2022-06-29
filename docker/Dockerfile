FROM openjdk:11

RUN apt update && apt install -y wkhtmltopdf binutils
RUN strip --remove-section=.note.ABI-tag /usr/lib/x86_64-linux-gnu/libQt5Core.so.5

WORKDIR /emailconverter

COPY ./emailconverter.jar ./emailconverter.jar

COPY ./convert_email ./
RUN chmod a+rx convert_email

ENTRYPOINT [ "./convert_email" ]
CMD [ "/source", "/target" ]
