#!/bin/bash

# https://toranbillups.com/blog/archive/2019/04/20/attach-iex-to-running-elixir-inside-docker-container/

set -e

str=`date -Ins | md5sum`
name=${str:0:10}
echo "NAME: $name"

mix phx.digest
mix ecto.create 
mix ecto.migrate
mix run priv/repo/seeds.exs

elixir --sname $name --cookie monster -S mix phx.server
