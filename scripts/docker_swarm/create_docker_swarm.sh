#!/usr/bin/env bash
#
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.
#

source ./scripts/docker_swarm/utils.sh
source ./scripts/docker_swarm/.env.sh

title "Creating Docker swarm for SINGA-Auto..."
docker swarm leave $1
docker swarm init --advertise-addr $DOCKER_SWARM_ADVERTISE_ADDR \
    || >&2 echo "Failed to init Docker swarm - continuing..."
docker network create $DOCKER_NETWORK -d overlay --attachable --scope=swarm \
    || >&2 echo  "Failed to create Docker network for swarm - continuing..."
