#!/bin/bash
# Usage: mssh.sh "machine1 [machine2...]" "command"

OUTPUT_LOG=/tmp/output-$$.log
ERROR_LOG=/tmp/error-$$.log
COMMAND=$1; shift
MACHINES=("" "")

for machine in ${MACHINES[@]}
do
    ssh -p58422 $machine $COMMAND >>$OUTPUT_LOG.$machine 2>>$ERROR_LOG.$machine &
    #ssh -p58422 $machine $COMMAND
    #echo "ssh -p58422 $machine $COMMAND >>$OUTPUT_LOG.$machine 2>>$ERROR_LOG.$machine &"
done

wait

cat $OUTPUT_LOG.*
cat $ERROR_LOG.* >&2
rm -f $OUTPUT_LOG.* $ERROR_LOG.*