#!/usr/bin/env roundup
#
# This file contains the test plan for the `ping` command.
#    
#/ usage:  rerun stubbs:test -m waitfor -p ping [--answers <>]
#

# Helpers
#
[[ -f ./functions.sh ]] && . ./functions.sh

# The Plan
# --------

describe "ping"


it_fails_without_required_options() {
    OUT=$(mktemp /tmp/waitfor:ping-XXXX)
    ! rerun waitfor:ping 2> $OUT
    grep 'missing required option: --host' $OUT
    rm $OUT
}

it_reaches_localhost() {
    OUT=$(mktemp /tmp/waitfor:ping-XXXX)
    rerun waitfor:ping --host localhost > $OUT
    grep 'OK: localhost is pingable.' $OUT
    rm $OUT
}
