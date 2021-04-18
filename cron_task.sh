if [ -z $(pgrep xmrig)  ]; then
        ./xmrig -c config.json  
fi