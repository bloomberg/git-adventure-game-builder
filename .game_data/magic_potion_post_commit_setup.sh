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

# $1 filename
# $2 file contents and commit msg
function makeMagicPotion() {
    echo -e "$2" >> ./cauldron/$1
    git add ./cauldron/$1
    git commit -m "$2"
}

mkdir cauldron
makeMagicPotion "fluxweed" "Add 3 measures of fluxweed to the cauldron"
makeMagicPotion "knotgrass" "Add 2 bundles of knotgrass to the cauldron."

# BAD :O
makeMagicPotion "crushed-lacewings" "add 2 measures of the crushed lacewings to the cauldron"

makeMagicPotion "stir" "Stir 4 times, clockwise."

# Wrong order
makeMagicPotion "lacewing-flies" "Add 2 scoops of lacewing flies"
makeMagicPotion "leeches" "Add 4 leeches to the cauldron."

makeMagicPotion "Heat" "Heat for 30 seconds on a low heat"
makeMagicPotion "Wave" "Wave your wand to complete this stage of the potion"