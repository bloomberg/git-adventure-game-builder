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

TARGET=$1
SOURCE=$2

mkdir -p ${TARGET}/.res
# This is taken from here https://www.asciiart.eu/mythology/unicorns
cp -v  ${SOURCE}/.game_data/mystical_creatures.res/unicorn ${TARGET}/.res

mkdir -p ${TARGET}/.res/dungeon
# This is taken from here https://www.asciiart.eu/mythology/ghosts
cp -v ${SOURCE}/.game_data/mystical_creatures.res/ghost ${TARGET}/.res/dungeon