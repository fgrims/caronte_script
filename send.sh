mkdir /tmp/pcap/pcapdir
while true
do
    rm -rf /tmp/pcap/pcapdir/*.pcap 
    sshpass -p "password" rsync -avzhe 'ssh -p 22' username@x.x.x.x:/home/vboxuser/pcapdir /tmp/pcap --remove-source-files
    find /tmp/pcap/pcapdir -type f -regex '.*pcap' -exec curl -X POST "http://localhost:3333/api/pcap/file" -H "Content-Type: application/json" -d '{"file":"{}","flush_all":false,"delete_original_file":false}' \;
    sleep 100
done

