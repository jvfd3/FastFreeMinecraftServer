FROM oraclelinux:8

RUN dnf module enable -y nodejs:18 && \
    dnf install -y nodejs python3 && \
     dnf install -y oracle-release-el8 && \
     dnf install -y oracle-instantclient19.19-basic oracle-instantclient19.19-devel && \    
     rm -rf /var/cache/dnf

WORKDIR /app
COPY src/* /app/
RUN npm install
CMD exec node rest.js