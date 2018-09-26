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
set -x

# Save the original config file (to restore it at the end)
cp .git/config .git/config.bak

############################################################
# Start the castle on the '03_whimsical_elf' branch
############################################################
touch castle
git add castle
git commit -m "The work on the castle begins ..."
pwd
echo $1
echo $2
echo $3
# ############################################################
# # Place work of elf 'Bushy Evergreen' into artefact backpack
# ############################################################
LEVEL_NUMBER=$2
git checkout -b ${LEVEL_NUMBER}_whimsical_elf_bushy
echo -e "[user]\n\tname = Bushy Evergreen\n\temail = Bushy.Evergreen@goblin-taxhaven.com\n" >> .git/config

cat ${3}/.game_data/castle.res/bushy.txt > castle
git add castle
git commit -m "Elf Bushy Evergreen works on the castle."
cp .git/config.bak .git/config

# Go back
git checkout -

###########################################################################
# Place work of elf 'Alabaster Snowball' into the '03_whimsical_elf' branch
###########################################################################
cat ${3}/.game_data/castle.res/alabaster.txt > castle
echo -e "[user]\n\tname = Alabaster Snowball\n\temail = Alabaster.Snowball@goblin-taxhaven.com\n" >> .git/config
git add castle
git commit -m "Elf Alabaster Snowball works on the castle."
cp .git/config.bak .git/config


# Restore the config and remove the backup (leave it as we've found it)
cp .git/config.bak .git/config
rm .git/config.bak
