#!/bin/sh

#  ETHER-1 Service Node docker template
#  Copyright © 2019 cryon.io
#
#  This program is free software: you can redistribute it and/or modify
#  it under the terms of the GNU Affero General Public License as published
#  by the Free Software Foundation, either version 3 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU Affero General Public License for more details.
#
#  You should have received a copy of the GNU Affero General Public License
#  along with this program.  If not, see <https://www.gnu.org/licenses/>.
#
#  Contact: cryi@tutanota.com

PATH_TO_SCRIPT=$(readlink -f "$0")
BASEDIR=$(dirname "$PATH_TO_SCRIPT")

container=$(docker-compose -f "$BASEDIR/../docker-compose.yml" ps -q mn)
if [ -z "$container" ]; then 
    # masternode is not running
    exit 1
fi

ver=$(docker exec "$container" curl -L -s https://api.ether1.org/mn/versions.json | jq '.sn.stable' --raw-output)
current_ver=$(sh "$BASEDIR/node-info.sh")
if echo "$current_ver" | grep -q "VERSION: $ver"; then
    exit 0
else
    docker-compose -f "$BASEDIR/../docker-compose.yml" build --no-cache && docker-compose -f "$BASEDIR/../docker-compose.yml" up -d --force-recreate -t 120
    sleep 10
    current_ver=$(sh "$BASEDIR/node-info.sh")
    if echo "$current_ver" | grep -q "VERSION: $ver" "$BASEDIR/../data/node.info"; then
        exit 0
    else 
        # failed to update masternode
        exit 2
    fi
fi