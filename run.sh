#!/bin/bash
echo -e "\n\n\033[36m _____  _____  _____
|  __ \\|  __ \\|  __ \\
| |__) | |__) | |__) |_      ___ __
|  ___/|  ___/|  ___/\\ \\ /\\ / / '_ \\
| |    | |    | |     \\ V  V /| | | |
|_|    |_|    |_|      \\_/\\_/ |_| |_|\033[0m
\n\033[33mhttps://github.com/TheOfficialFloW/PPPwn\033[0m\n" | sudo tee /dev/tty1
echo -e "\033[1;45m  PPPWN 64 EXTREME EDITION UNTUK PS4 CURSED-MODEL REWEL KE-HEN  \033[0m\n" | sudo tee /dev/tty1

ARCH=$(uname -m)
INTERFACE="eth0"
FIRMWAREVERSION="11.00"
SHUTDOWN=true


if [ "$ARCH" = "x86_64" ]; then
	echo -e "\033[32mArchitecture is x86_64\033[0m"
	echo -e "\n\033[32mReady for console connection\033[92m\nFirmware:\033[93m $FIRMWAREVERSION\033[92m\nInterface:\033[93m $INTERFACE\033[0m\n"

	sudo ip link set $INTERFACE down
	coproc read -t 2 && wait "$!" || true
	sudo ip link set $INTERFACE up

	ret=$(sudo /boot/.pppwn/pppwn_x86_64 --interface "$INTERFACE" --fw "${FIRMWAREVERSION//.}" --stage1 "/boot/.pppwn/stage1.bin" --stage2 "/boot/.pppwn/stage2.bin" --timeout 10 --auto-retry)

	if [ $SHUTDOWN = true ] ; then
		echo -e "\033[32msystem poweroff\033[0m"
		sudo poweroff
	fi

elif [[ "$ARCH" == aarch64* ]]; then
	echo -e "\033[32mSTB PS4 AUTO HEN UNTUK MODEL REWEL\033[0m"
	echo -e "\n\033[32mProses Jailbreak\033[92m\nFirmware:\033[93m $FIRMWAREVERSION\033[92m\nKoneksi:\033[93m $INTERFACE\033[0m\n"

	sudo ip link set $INTERFACE down
	coproc read -t 2 && wait "$!" || true
	sudo ip link set $INTERFACE up

	ret=$(sudo /boot/.pppwn/pppwn_v6 --interface "$INTERFACE" --fw "${FIRMWAREVERSION//.}" --stage1 "/boot/.pppwn/stage1.bin" --stage2 "/boot/.pppwn/stage2.bin" --timeout 5 --auto-retry -nw -wap 2)

	if [ $SHUTDOWN = true ] ; then
		echo -e "\033[32msystem poweroff\033[0m"
		sudo poweroff
	fi

elif [[ "$ARCH" == armv7* ]]; then
	echo -e "\033[32mArchitecture is armv7 or variant\033[0m"
	echo -e "\n\033[32mReady for console connection\033[92m\nFirmware:\033[93m $FIRMWAREVERSION\033[92m\nInterface:\033[93m $INTERFACE\033[0m\n"

	sudo ip link set $INTERFACE down
	coproc read -t 2 && wait "$!" || true
	sudo ip link set $INTERFACE up

	ret=$(sudo /boot/.pppwn/pppwn_armv7 --interface "$INTERFACE" --fw "${FIRMWAREVERSION//.}" --stage1 "/boot/.pppwn/stage1.bin" --stage2 "/boot/.pppwn/stage2.bin" --timeout 5 --auto-retry -nw -wap 2)

	if [ $SHUTDOWN = true ] ; then
		echo -e "\033[32msystem poweroff\033[0m"
		sudo poweroff
	fi

else
    echo "Unknown architecture: $ARCH, error"
fi


