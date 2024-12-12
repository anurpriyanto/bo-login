## STAGE 1: Build dist/
FROM node:14 AS builder

WORKDIR /usr/src/app
COPY config/. ./
# Copy the ZIP file into the container
COPY bologin.zip ./bologin.zip
ENV PATH /node_modules/.bin:$PATH
ENV NODE_OPTIONS=--max-old-space-size=8192


# Install unzip, unzip the file, and remove the ZIP to save space
RUN apt-get update && apt-get install -y unzip && \
    unzip bologin.zip -d ./

# Install dependencies and build the project
#RUN mv /usr/src/app/configreport/index.html ./index.html

EXPOSE 9003

## STAGE 2: Serve with Nginx
FROM nginx:alpine

WORKDIR /usr/share/nginx/html

# Clean up existing HTML files
RUN rm -rf ./*

# Copy the build from the builder stage
COPY --from=builder /usr/src/app/. bologin/

# Copy the custom Nginx configuration
COPY nginx-ejs.conf /etc/nginx/conf.d/

# Start Nginx
ENTRYPOINT ["nginx", "-g", "daemon off;"]
