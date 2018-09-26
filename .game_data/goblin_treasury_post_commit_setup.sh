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

addDiamond () {
    export NAME=$1
    echo -e "[user]\n\tname = ${NAME}\n\temail = ${NAME}@goblin-taxhaven.com\n" >> .git/config
    echo '************************' >> treasury
    git add treasury
    git commit -m "more diamonds"
    cp .git/config.bak .git/config
}

stealDiamond () {
    export NAME=$1
    echo -e "[user]\n\tname = ${NAME}\n\temail = ${NAME}@goblin-taxhaven.com\n" >> .git/config
    sed -i '17s/.*//' treasury
    git add treasury
    git commit -m "more diamonds"
    cp .git/config.bak .git/config
}

# First, create the treasury

touch treasury
git add treasury
git commit -m "Create treasury"

# Save the original config file (to restore it at the end)
cp .git/config .git/config.bak

# Add diamonds
for i in `seq 1 5`;
do
    addDiamond "Stord"
    addDiamond "Krenk"
    addDiamond "Grord"
    addDiamond "Stord"
done

# Steal diamonds :O
stealDiamond "Grord"

# Add diamonds
for i in `seq 1 5`;
do
    addDiamond "Stord"
    addDiamond "Krenk"
    addDiamond "Grord"
    addDiamond "Stord"
done

# Restore the config and remove the backup (leave it as we've found it)
cp .git/config.bak .git/config
rm .git/config.bak
