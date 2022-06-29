FROM openjdk:11 AS JarBuilder

WORKDIR /emailconverter

RUN git clone https://github.com/Kris-LIBIS/email-to-pdf-converter.git . \
 && ./gradlew shadowJar

FROM openjdk:11

RUN apt update && apt install -y wkhtmltopdf

WORKDIR /emailconverter

COPY --from=JarBuilder /emailconverter/build/libs/emailconverter*.jar ./emailconverter.jar

COPY ./convert_email ./
RUN chmod a+rx convert_email

ENTRYPOINT [ "./convert_email" ]
CMD [ "/source", "/target" ]
