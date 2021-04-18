link;
echo "====================";
echo "====================";
echo "";
echo "===   BOLDOG    ===";
echo "=== BÁNYÁSZÁST  ===";
echo "";
echo "====================";
echo "====================";

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        # linux
         link="https://github.com/xmrig/xmrig/releases/download/v6.11.2/xmrig-6.11.2-focal-x64.tar.gz";
         
elif [[ "$OSTYPE" == "darwin"* ]]; then
        # MacOS
         link="https://github.com/xmrig/xmrig/releases/download/v6.11.2/xmrig-6.11.2-macos-x64.tar.gz";

elif [[ "$OSTYPE" == "cygwin" ]]; then
        # POSIX compatibility layer and Linux environment emulation for Windows
         link="https://github.com/xmrig/xmrig/releases/download/v6.11.2/xmrig-6.11.2-linux-x64.tar.gz";
elif [[ "$OSTYPE" == "win64" ]]; then
        # I'm not sure this can happen.
        link="https://github.com/xmrig/xmrig/releases/download/v6.11.2/xmrig-6.11.2-msvc-cuda10_2-win64.zip"; 

elif [[ "$OSTYPE" == "FreeBSD" ]]; then
        # I'm not sure this can happen.
        link="https://github.com/xmrig/xmrig/releases/download/v6.11.2/xmrig-6.11.2-freebsd-static-x64.tar.gz";
               
else
        link="unknown";  
        # Unknown.
fi



if [ "$link" != "unknown" ] && [ "$OSTYPE" != "win64" ]; then

      

            curl -L -s $link > file.tar    &&
            tar -xf file.tar -k            &&
            rm file.tar                    &&
            cp xmrig-6.11.2/xmrig ./       &&
            rm -rf xmrig-6.11.2            &&

            # ===============================
            # ezt a részt kikommentelem !
            # cronjob : minden órában ellenőrizzem hogy fut-e a xmrig : pgrep xmrig
            # ha nem, akkor indítsa el a xmrig-et és bányásszon.....
            #   
            #   BASEDIR=$(dirname $0)
            #   
            #   crontab -l > mycron
            #   echo "0 * * * * EOF ${BASEDIR}/cron_task.sh" >> mycron
            #   crontab mycron
            #   rm mycron

            #
            # ===============================

            ./xmrig -c config.json


elif [ "$link" != "unknown" ] && [ "$OSTYPE" == "win64" ]; then

            curl -L -s $link > file.zip    &&
            tar -xf file.zip -k            &&
            rm file.zip                    &&
            cp xmrig-6.11.2/xmrig ./       &&
            rm -rf xmrig-6.11.2            &&
            ./xmrig -c config.json


fi
