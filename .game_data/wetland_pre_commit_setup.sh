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
echo "** $0 $1 $2"
echo "** This script is executed by 'setup_clean_repo' _before_ commiting the"
echo "** level data."
echo "** Use this to add any additional data to the level you need."
echo "************************************************************************"

SRC=${2}
TARGET=${1}

cp "${SRC}"/.game_data/wetland.res/plate_start.txt "${TARGET}"/shard.txt
git add "${TARGET}"/shard.txt

