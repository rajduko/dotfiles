declare -A macs
macs=( ["abc"]="mac1" 
       ["def"]="mac2" 
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

