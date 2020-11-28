rem IP address for VPN server
set VPS_PUBLIC_IP=1.2.3.4

rem download install-vpn.sh from git to server and execute
ssh ary@%VPS_PUBLIC_IP% "wget -O - https://raw.githubusercontent.com/musukvl/fast-openvpn-setup/main/install-vpn.sh | bash"
rem download vpn client file to local
scp ary@%VPS_PUBLIC_IP%:/home/ary/vpn/openvpn_conf/client.ovpn  .