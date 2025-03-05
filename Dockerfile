FROM node:16-alpine

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

# 创建必要的目录
RUN mkdir -p ./temp ./public ./functions

# 为Netlify环境准备
RUN if [ ! -d "./public" ]; then mkdir -p ./public; fi
RUN if [ ! -d "./functions" ]; then mkdir -p ./functions; fi

EXPOSE 3000

CMD ["npm", "start"]