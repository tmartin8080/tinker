FROM bitwalker/alpine-elixir-phoenix:latest

RUN mkdir /app
COPY . /app
WORKDIR /app

# Install hex package manager
RUN mix local.hex --force

# Compile the project
RUN mix do deps.get, deps.compile, compile
