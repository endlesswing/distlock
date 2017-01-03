FROM spearheadea/tsnode:6.9.1-slim-2.0.9

WORKDIR /app
COPY package.json /app/
COPY .gitignore .npmignore /app/

RUN apt-get update \
        && apt-get install git -y

RUN npm i
RUN ls

COPY spec /app/spec
COPY src /app/src
COPY lua /app/lua
COPY tsconfig.json gulpfile.js /app/

RUN npm run build