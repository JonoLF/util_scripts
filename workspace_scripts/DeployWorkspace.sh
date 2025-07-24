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

# setup functions for workspaces
deployDesignWorkspace() {
    # launch apps
    flatpak run com.spotify.Client &
    sleep 2
    firefox &
    sleep 2
    open "obsidian://open?vault=DesignProject" &
    sleep 2
}

deployInvestigationWorkspace() {
    # launch apps
    flatpak run com.spotify.Client &
    sleep 2
    firefox &
    sleep 2
    open "obsidian://open?vault=InvestigationProject" &
    sleep 2
}

# check expected values of workspace
# compare all upper case values for consistency
case "${workspace^^}" in
    "DESIGN")
        echo "Deploying design project workspace"
        deployDesignWorkspace
        ;;
    "INVESTIGATION")
        echo "Deploying investigation project workspace"
        deployInvestigationWorkspace
        ;;
    *)
        echo "Unsupported option!"
        usage
        ;;
esac
    
