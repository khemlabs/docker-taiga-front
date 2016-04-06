FROM node:4.1.1

EXPOSE 3000

# Install Git
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

# Copy application folder and configurations
RUN mkdir -p /usr/local/taiga
COPY ./ /usr/local/taiga/

# Install taiga-front-dist
RUN \
  cd /usr/local/taiga/taiga-front-dist  \
  git checkout stable   \
  git pull origin stable \

RUN \
  chmod +x /usr/local/taiga/configure && \
  sh /usr/local/taiga/configure

WORKDIR /usr/local/taiga/
# Install dependencies
RUN \
    npm install -g forever && \
    npm install express 
# Install dependencies

CMD ["forever", "app.js"]
