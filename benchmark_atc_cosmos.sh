

FINISH_EZ=0
FINISH_LZ=1
NOFINISH_EZ=2
NOFINISH_LZ=3

OPTIONS=/home/micron/YCSB-cpp/rocksdb/zenfsoptions.ini
RESULT_DIR_PATH=/home/micron/ATC_testdata/YCSB_cosmos/36GB

# PHASE=load

DEV=nvme0n1

# OPENZONE=10
A="a"

for SCHEME in  $FINISH_EZ $NOFINISH_LZ $NOFINISH_EZ $FINISH_LZ
do
#    echo "${OPENZONE}" > /home/micron/ATC_testdata/tmp
    for i in tmp
    do
        for WORKLOAD_TYPE in uniform
        do  
            #for SCHEME in $NOFINISH_LZ $NOFINISH_EZ $FINISH_LZ $FINISH_EZ 
	    for OPENZONE in 5 10 30 64
	    do
		echo  "${OPENZONE}" > /home/micron/ATC_testdata/tmp
                    if [ $SCHEME -eq $FINISH_EZ ]; then
                        RESULT_PATH=${RESULT_DIR_PATH}/${WORKLOAD_TYPE}_FINISH_EZ_${OPENZONE}_${i}.txt
                        OPTIONS=/home/micron/YCSB-cpp/rocksdb/zlsm_motivation.ini
                        sed -i "s/^  finish_scheme=.*/  finish_scheme=0/" $OPTIONS
                        sed -i "s/^  reset_scheme=.*/  reset_scheme=0/" $OPTIONS
                    elif [ $SCHEME -eq $FINISH_LZ ]; then
                        RESULT_PATH=${RESULT_DIR_PATH}/${WORKLOAD_TYPE}_FINISH_LZ_${OPENZONE}_${i}.txt
                        OPTIONS=/home/micron/YCSB-cpp/rocksdb/zlsm_motivation.ini
                        sed -i "s/^  finish_scheme=.*/  finish_scheme=0/" $OPTIONS
                        sed -i "s/^  reset_scheme=.*/  reset_scheme=1/" $OPTIONS
                    elif [ $SCHEME -eq $NOFINISH_EZ ]; then
                        RESULT_PATH=${RESULT_DIR_PATH}/${WORKLOAD_TYPE}_NOFINISH_EZ_${OPENZONE}_${i}.txt
                        OPTIONS=/home/micron/YCSB-cpp/rocksdb/zlsm_motivation.ini
                        sed -i "s/^  finish_scheme=.*/  finish_scheme=1/" $OPTIONS
                        sed -i "s/^  reset_scheme=.*/  reset_scheme=0/" $OPTIONS
                    elif [ $SCHEME -eq $NOFINISH_LZ ]; then
                        RESULT_PATH=${RESULT_DIR_PATH}/${WORKLOAD_TYPE}_NOFINISH_LZ_${OPENZONE}_${i}.txt
                        OPTIONS=/home/micron/YCSB-cpp/rocksdb/zlsm_motivation.ini
                        sed -i "s/^  finish_scheme=.*/  finish_scheme=1/" $OPTIONS
                        sed -i "s/^  reset_scheme=.*/  reset_scheme=1/" $OPTIONS
                    else  
                        echo "error"
                    fi
                if [ -f ${RESULT_PATH} ]; then
                    echo "already $RESULT_PATH exists"
                    # sleep 30
                    sleep 5
                    continue
                    # break
                fi
                # if [ "$WORKLOAD_TYPE" = "$A" ]; then
                #     PHASE=load
                # else
                #     PHASE=run
                # fi

                while : 
                    do
                    sudo /home/micron/zone_reset_all 0 200 > /home/micron/tmp
                    sudo rm -rf /home/micron/log
                    sudo mkdir -p /home/micron/log
                    echo "none" | sudo tee /sys/block/${DEV}/queue/scheduler
                    
                    
                    sudo /home/micron/EZC/rocksdb/plugin/zenfs/util/zenfs mkfs --force --enable_gc \
                    --zbd=/${DEV} --aux_path=/home/micron/log > /home/micron/tmp2

                    echo ${RESULT_PATH}
                    sudo cp ${OPTIONS} /home/micron/log/zenfsoptions.ini

                    sudo /home/micron/YCSB-cpp/ycsb -load -db rocksdb -P workloads/workload_${WORKLOAD_TYPE} -P rocksdb/rocksdb.properties -s > ${RESULT_DIR_PATH}/tmp
                    
                    if grep -q "BLOCKING TIME(ms)" ${RESULT_DIR_PATH}/tmp; then
                        cat ${RESULT_DIR_PATH}/tmp > ${RESULT_PATH}
                        rm -rf ${RESULT_DIR_PATH}/tmp
                        break
                    else
                        cat ${RESULT_DIR_PATH}/tmp > ${RESULT_DIR_PATH}/failed
                        sleep 5
                        break
                    fi
                done
            done
        done
    done
done

echo "all done"

sudo /home/micron/access_testdata/sendresultmail

