#!/bin/bash
export port=8086
export WEB_HOST="your-web-host.com" # Replace with your actual web host
export API_SERVICE="https://$port-$WEB_HOST"
echo $API_SERVICE