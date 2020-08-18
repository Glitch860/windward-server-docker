FROM mono:slim

# Environment variables
ENV WINDWARD_SERVER_NAME "Docker Test"
ENV WINDWARD_SERVER_WORLD "testing"
ENV WINDWARD_SERVER_PORT 5127
ENV WINDWARD_ADMINS ""
ENV WINDWARD_PUBLIC 0

# Install dependencies
# - curl: Health check
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y curl unzip && \
    apt-get clean -y

# Create app folder
RUN mkdir -p /windward

# Download last server
WORKDIR /tmp
RUN curl -O -J -L http://www.tasharen.com/windward/WWServer.zip && \
    unzip /tmp/WWServer.zip && \
    cp /tmp/WWServer.exe /windward/ && \
    rm -f /tmp/WWS*

# Copy scripts
COPY run.sh check.sh /windward/

# Set execution permissions
RUN chmod u+x /windward/WWServer.exe && \
    chmod u+x /windward/run.sh && \
    chmod u+x /windward/check.sh

# Configuration
EXPOSE 5127
WORKDIR /windward

# Run container
ENTRYPOINT /windward/run.sh
HEALTHCHECK CMD /windward/check.sh
