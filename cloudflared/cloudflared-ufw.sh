#!/bin/sh
### This is a script from Paul-Reed, with some minor tweaks that follows the other scripts in this folder that Hudater >### I take no credit for this. https://github.com/Paul-Reed/cloudflare-ufw/blob/master/cloudflare-ufw.sh

curl -s https://www.cloudflare.com/ips-v4 -o ~/.cloudflared/cf_ips
echo "" >> ~/.cloudflared/cf_ips
curl -s https://www.cloudflare.com/ips-v6 >> ~/.cloudflared/cf_ips

# Allow all traffic from Cloudflare IPs (no ports restriction)
for cfip in `cat ~/.cloudflared/cf_ips`; do ufw allow proto tcp from $cfip to any port 80,443 comment 'Cloudflare IP'; >

ufw reload > /dev/null
