#!/bin/env bash
set -eo pipefail

workspace=""

usage() {
    cat <<EOF
Usage: $(basename $0) [-w | --workspace "workspace"]
-w | --workspace -> The workspace to launch (design, investigation)
    -h -> Display this help message
EOF
    exit 1
}

# Check if any options were provided
if [ $# -eq 0 ]; then
    echo "No options provided"
    usage
fi

# Parse options
while [ $# -gt 0 ]; do
    case $1 in
        -w | --workspace)
             if [ -n "$2" ]; then
                workspace="$2"
                shift 2
            else
                echo "Error: --workspace requires a value"
                usage
            fi
            ;;
        -h | --help) 
            usage
            break
            ;;
        -- ) 
            shift;
            break
            ;;
        * ) 
            echo "Unexpected option: $1"
            usage
            break
            ;;
    esac
done

# check expected values of workspace
# compare all upper case values for consistency
case "${workspace^^}" in
    
