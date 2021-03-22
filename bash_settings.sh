declare -A macs
macs=( ["vela"]="24:7f:20:f6:d0:0c" 
       ["minos"]="00:11:D9:86:49:09" 
       ["taos"]="5c:b0:66:ae:55:0b" 
       ["neu"]="00:11:D9:30:CC:A1"
       ["leo"]="00:11:D9:4C:05:33"
       ["lego"]="00:11:D9:37:0A:F5"
       ["dex"]="5C:B0:66:3E:D9:FB"
       ["axl"]="00:11:D9:56:F6:63"
       ["pace"]="E0:B7:B1:A5:53:FC"
       ["args"]="00:11:D9:61:B6:A8"
       ["sbox"]="BC:64:4B:07:2A:C0"
       ["ebox"]="00:1A:46:80:29:20"
       )

deviceIp=""

# Get IP of a device.
function gipmac()
{
    if [ "$1" != "" ]; then
        deviceIp=`arp -n | grep -i $1 | head -1| awk '{print $1}'`
        #deviceIp=`ip neighbor | grep -v STALE | grep -i $1 | cut -d' '  -f 1`
        #deviceIp=`ip neighbor  | grep -i $1 | head -1 | cut -d' '  -f 1`
        if [ "$deviceIp" != "" ]; then
            echo "IP for MAC'$1' is $deviceIp"
        else
            echo "IP for MAC '$1' is not found"
        fi
    else
        echo "Provide MAC"
    fi

    return 0
}
function gip()
{
    if [ "$1" != "" ]; then
        mac="${macs[$1]}"
        if [ "$mac" != "" ]; then
            gipmac $mac
            if [ "$deviceIp" != "" ]; then
                echo "IP for device '$1' is $deviceIp"
            else
                echo "IP for device '$1' is not found"
            fi
        else
            echo "Device '$1' doesn't have a MAC mapped"
            echo "Listed devices are: "
            for i in "${!macs[@]}"
            do
                echo "  $i -> ${macs[$i]}"
            done
            echo ""
        fi
    else
        echo "Provide name of device"
    fi

    return 0
}

function tel()
{
    # Reset deviceIp global variables
    deviceIp=""

    gip $1
    if [ "$deviceIp" != "" ]; then
        telnet $deviceIp;
    fi
}

function telmac()
{
    # Reset deviceIp global variables
    deviceIp=""

    gipmac $1
    if [ "$deviceIp" != "" ]; then
        telnet $deviceIp;
    fi
}



function start_minicom()
{
    sudo minicom $1 -C /sandbox/mlogs/"$1"
}

