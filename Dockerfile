FROM ubuntu:latest

LABEL com.github.actions.name="c-linter check"
LABEL com.github.actions.description="Lint your code with cppcheck"
LABEL com.github.actions.icon="code"
LABEL com.github.actions.color="gray-dark"

LABEL repository="https://github.com/appliedinnovation/cppcheck-action"

WORKDIR /build
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get -qq -y install curl cmake jq clang cppcheck git

ADD runchecks.sh /entrypoint.sh
COPY . .
RUN chmod +x /entrypoint.sh
ENTRYPOINT /entrypoint.sh
