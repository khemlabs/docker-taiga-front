FROM node:4.1.1

EXPOSE 3000

# Install Git
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

# Copy application folder and configurations
RUN mkdir -p /usr/local/taiga
COPY ./ /usr/local/taiga/

WORKDIR /usr/local/taiga/
# Install taiga-front-dist
RUN \
  cd taiga-front-dist  \
  git checkout stable   \
  git pull origin stable \

RUN \
  chmod +x /usr/local/taiga/configure && \
  ./configure

# Install dependencies
#RUN npm install -g  express \
#		    forever
                    
# Install dependencies

CMD ["forever", "app.js"]
