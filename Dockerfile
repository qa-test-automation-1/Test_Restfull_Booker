FROM node:22-bookworm

RUN apt-get update && \
    apt-get install -y openjdk-17-jre-headless wget unzip && \
    rm -rf /var/lib/apt/lists/*

RUN npm install -g newman newman-reporter-htmlextra

RUN wget https://dlcdn.apache.org/jmeter/binaries/apache-jmeter-5.6.3.zip && \
    unzip apache-jmeter-5.6.3.zip -d /opt && \
    rm apache-jmeter-5.6.3.zip

ENV JMETER_HOME=/opt/apache-jmeter-5.6.3
ENV PATH="${JMETER_HOME}/bin:${PATH}"

WORKDIR /app

COPY Postman ./Postman
COPY Jmeter ./Jmeter

RUN mkdir -p reports/postman reports/jmeter

CMD ["sh", "-c", "newman run Postman/API_test.json --env-var host=https://automationintesting.online -r cli,htmlextra --reporter-htmlextra-export reports/postman/report.html && jmeter -n -t Jmeter/Plan_testow.jmx -l reports/jmeter/results.jtl -e -o reports/jmeter/html"]