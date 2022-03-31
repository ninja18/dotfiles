function sessh() {
    username="${1:=ubuntu-india}"

    echo "trying: $username"
    tailscale up

    ip=$(tailscale status | awk -v username=${username} '$0 ~ username { print $1 }')

    if [[ -z $ip ]]; then 
        echo "Error: No IP found for this username: $username\n"
        tailscale status
        echo "\nUsage: $0 [ remote username ]" 1>&2
        return 6
    fi

    ssh ubuntu@$ip
}


function global_replace_usage() {
    echo "Usage:\n $1 [-p pattern based | -f file based] [search pattern] [find string] [replace string] [directory to search]"
    echo "Example usage:"
    echo " $1 -f *.txt \"some(thing|where)\" \"nothing\" ."
    echo " $1 -p \"some(thing|where)\" \"some(thing|where)\" \"nothing\" testdir"
}


function replace_by_file_pattern() {
    local search_pattern=$1
    local find_string=$2
    local replace_string=$3
    local search_dir=$4

    find $search_dir -type f -name "$search_pattern" -exec sed -i '' -r "s~$find_string~$replace_string~" {} \;
}


function replace_by_content_pattern() {
    local search_pattern=$1
    local find_string=$2
    local replace_string=$3
    local search_dir=$4

    # rg -l -e $search_pattern $search_dir | xargs sed -i '' -r "s~$find_string~$replace_string~"
    grep -l -r -E $search_pattern $search_dir | xargs sed -i '' -r "s~$find_string~$replace_string~"

}


function global_replace() {
    while getopts 'fph' option; do
        case "$option" in
            f)
                local command=replace_by_file_pattern
                ;;

            p)
                local command=replace_by_content_pattern
                ;;

            ?|h)
                global_replace_usage $(basename $0)
                return 1
                ;;
        esac
    done
    shift "$(($OPTIND-1))"

    if [[ -z $command ]]; then
        echo "Missing required flags [-f | -p ]" 1>&2
        global_replace_usage $(basename $0)
        return 2
    elif [[ "$#" -ne 4 ]]; then
        echo "Missing arguments, expected 4 got $#" 1>&2
        global_replace_usage $(basename $0)
        return 2
    fi

    local search_pattern=$1
    local find_string=$2
    local replace_string=$3
    local search_dir=$4

    $command $search_pattern $find_string $replace_string $search_dir
}


#global_replace -f|-p <search pattern> -r <line range> <find string> <replace string> -o <sed options> <dir name>

# basic file based find and replace word not regex - Done
# basic file based find and replace regex - Done
# basic pattern based find and replace word not regex - Done
# basic pattern based find and replace regex - Done
# above four with regex find - Done
# all two with custom directory - Done
# all two with missing positional args - Done
# all two with missing positional flags - Done
# all two with two sed options
# all two with custom single line range
# all two with custom double line range
# very all three arguments with single quote and double quote
# print number of files modified
# print number of instances modified
# Test all the above cases once

function jws_encode_usage() {
    echo "Usage:\n $1 [json data file] [private key pem file] [algorithm name]"
    echo "Example usage:"
    echo " $1 config.json key.pem ES384"
}

function jws_encode() {
    if [[ "$#" -ne 3 ]]; then
        echo "Missing arguments, expected 3 got $#" 1>&2
        jws_encode_usage $(basename $0)
        return 2
    fi

    local data=$1
    local private_key=$2
    local algorithm=$3

    # call python script pass args
    python - $data $private_key $algorithm << EOF
import jwt
from pathlib import Path
import json
import sys

private_key = Path(sys.argv[2]).read_text()
payload = Path(sys.argv[1]).read_text()
encoded = jwt.encode(json.loads(payload), private_key, algorithm=sys.argv[3])
print(encoded)
EOF

}

# Questions:
# why [[ ]] than [ ]

# Knowledge
# use local for variables in funcs
# use return if its a func ran in shell directly
# 
