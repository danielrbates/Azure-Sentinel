#!/bin/bash

# Loop over all running Docker containers
for container_id in $(docker ps -q)
do
    # Get the container name
    container_name=$(docker inspect --format '{{ .Name }}' $container_id | sed 's|/||')

    # Check if the container has the SENTINEL_AGENT_GUID environment variable
    sentinel_agent_guid=$(docker inspect --format '{{range $index, $value := .Config.Env}}{{if eq (index (split $value "=") 0) "SENTINEL_AGENT_GUID"}}{{index (split $value "=") 1}}{{end}}{{end}}' $container_id)

    if [[ -n $sentinel_agent_guid ]]; then
        # Print the container name and SENTINEL_AGENT_GUID value
        echo "Container: $container_name"
        echo "SENTINEL_AGENT_GUID: $sentinel_agent_guid"
        echo ""
    fi
done

