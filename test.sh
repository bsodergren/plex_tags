#!/usr/bin/env bash
shopt -s expand_aliases
	shopt -s nocasematch

export __SCRIPT_NAME__=${BASH_SOURCE[0]#*/}
export __SOURCE_DIRECTORY__=$( cd "${BASH_SOURCE[0]%/*}" && pwd )
export __INC_LIB_DIR__="${__SOURCE_DIRECTORY__}/inc"

source "${__INC_LIB_DIR__}/header.inc.sh"
source "${__SOURCE_DIRECTORY__}/lib/oo-bootstrap.sh"
import util/log util/exception util/tryCatch util/namedParameters util/class

myLoggingDelegate() {
    echo $*
    echo "$(date +'%F %T %Z') [${subject}]: $*"
    echo "$(date +'%F %T %Z') [${subject}]: $*" >> $__logr_SCRIPT_LOG
}

namespace myApp
Log::RegisterLogger MYLOGGER myLoggingDelegate
Log::AddOutput myApp MYLOGGER

subject="WARNING" Log "Something"

## YOUR CODE GOES HERE ##
echo "$(UI.Color.Blue)I'm blue...$(UI.Color.Default)"
Log "Play me some Jazz, will ya"

