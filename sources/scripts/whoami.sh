#!/usr/bin/env bash

whoami_var=$(whoami)

if [[ "$whoami_var" == "megadrage" ]]; then
    modified_name="MegaDrage"
else
    modified_name=$(echo "${whoami_var^}")
fi

echo "$modified_name"