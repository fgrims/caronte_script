
i=0
cd ../../
mkdir pcapdir
cd pcapdir
while true 
do 
    sudo tcpdump -c 10000 -i interfaccia -w $i.pcap -s 65535
    let i++
done  
