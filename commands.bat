rem IP address for VPN server
set VPS_PUBLIC_IP=1.2.3.4

rem download install-vpn.sh from git to server and execute
ssh ary@%VPS_PUBLIC_IP% "wget -O - https://gist.githubusercontent.com/musukvl/63367edcc9ae643baf1aac4a348a6828/raw/ac2a2194af647f82edc78febd40d205dd4e7c12e/install-vpn.sh | bash"
rem download vpn client file to local
scp ary@%VPS_PUBLIC_IP%:/home/ary/vpn/openvpn_conf/client.ovpn  .