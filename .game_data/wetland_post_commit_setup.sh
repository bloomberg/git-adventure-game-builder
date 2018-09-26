#!/bin/bash
#
# Copyright 2018 Bloomberg Finance L.P.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

echo "************************************************************************"
echo "** $0 $1 $2" "$3"
echo "** This script is executed by 'setup_clean_repo' _after_ commiting the"
echo "** level data."
echo "** Use this add any other branches or commits or change git history."
echo "************************************************************************"

set -e

MF_LEVEL=$(git rev-parse --abbrev-ref HEAD)

TARGET=$1
LEVEL_NUM=$2
SOURCE=$3

(
    cd "${TARGET}"
    git checkout ${MF_LEVEL}
    git checkout --orphan ${MF_LEVEL}_shallow_waters

    cp "${SOURCE}"/.game_data/wetland.res/ground.txt shard.txt
    git add shard.txt
    git commit -m"The bottom"

    cp "${SOURCE}"/.game_data/wetland.res/plate_start.txt shard.txt
    git add shard.txt
    git commit -m"It starts to look promising"

    cp "${SOURCE}"/.game_data/wetland.res/one_plate_piece.txt shard.txt
    git add shard.txt
    git commit -m"A shard!"

    cp "${SOURCE}"/.game_data/wetland.res/water.txt shard.txt
    git add shard.txt
    git commit -m"Just water floating around!"
)
(
    cd "${TARGET}"
    git checkout ${MF_LEVEL}
    git checkout --orphan ${MF_LEVEL}_swamp


    cp "${SOURCE}"/.game_data/wetland.res/ground.txt shard.txt
    git add shard.txt
    git commit -m"The bottom"

    cp "${SOURCE}"/.game_data/wetland.res/plate_start.txt shard.txt
    git add shard.txt
    git commit -m"It starts to look promising"

    cp "${SOURCE}"/.game_data/wetland.res/another_plate_piece.txt shard.txt
    git add shard.txt
    git commit -m"A shard!"

    cp "${SOURCE}"/.game_data/wetland.res/water.txt shard.txt
    git add shard.txt
    git commit -m"Just water floating around!"
)
