### Run script at your own risk. This is only tested in my personal environment. Please read script before running it on your system
# Not a very neat and clean script please forgive me
### This is a script a buddy of mine Hudater created. Go star this and follow Hudater at https://github.com/Hudater

#!/bin/sh
printf "WARNING: Use this script if tunnel is installed via CLI\n"

printf "Enter A/a to delete tunnel and binary or B/b to just uninstall binary. Anything else to exit\n"
read userInput
case $userInput in
  A|a)
    printf "\nYour tunnels are:\n $(cloudflared tunnel list)\n"
    printf "\nEnter your tunnel name to delete: "
    read userInput
    printf $userInput
    cloudflared tunnel delete $userInput
    printf "\nUninstalling cloudflared binary!\n"
    dpkg -r cloudflared
    mv /root/.cloudflared /root/.cloudflared-BAK
    exit 0;
    ;;

  N|n)
    printf "\nYour tunnel is untouched.\n"
    printf "\nUninstalling cloudflared binary!\n"
    dpkg -r cloudflared
    mv /root/.cloudflared /root/.cloudflared-BAK
    exit 0;
    ;;

  *)
    printf "Invalid input. Exiting with code 1"
    exit 1;
    ;;
esac
