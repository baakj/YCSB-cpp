#!/bin/bash

FINISH_EZ=0
NOFINISH_EZ=1
NOFINISH_PRO_EZ=2
FINISH_PRO_EZ=3
FINISH_PRO_CB1_EZ=4
FINISH_PRO_CB2_EZ=5

OPTIONS=/home/jaewan/연구/YCSB-cpp/rocksdb/zlsm_motivation.ini
#OPTIONS=/home/jaewan/연구/YCSB-cpp/rocksdb/zenfsoptions.ini

RESULT_DIR_PATH=/home/jaewan/연구/ATC_testdata/YCSB_zns/36GB

DEV=nvme0n2
# $FINISH_EZ $NOFINISH_EZ $FINISH_PRO_CB2_EZ

for SCHEME in  $FINISH_PRO_EZ $FINISH_PRO_CB1_EZ ; 
do
    for WORKLOAD_TYPE in uniform
    do  
        echo "Running with fixed Open Zone Limit: 14"

        echo "${MAX_NR_OPEN_IO_ZONES}" > /home/jaewan/연구/ATC_testdata/tmp/openzone_value

        if [ $SCHEME -eq $FINISH_EZ ]; then
            RESULT_PATH=${RESULT_DIR_PATH}/${WORKLOAD_TYPE}_FINISH_EZ.txt
            OPTIONS=/home/jaewan/연구/YCSB-cpp/rocksdb/zlsm_motivation.ini
            sed -i "s/^  finish_scheme=.*/  finish_scheme=0/" $OPTIONS
            sed -i "s/^  reset_scheme=.*/  reset_scheme=0/" $OPTIONS
        elif [ $SCHEME -eq $NOFINISH_EZ ]; then
            RESULT_PATH=${RESULT_DIR_PATH}/${WORKLOAD_TYPE}_NOFINISH_EZ.txt
            OPTIONS=/home/jaewan/연구/YCSB-cpp/rocksdb/zlsm_motivation.ini
            sed -i "s/^  finish_scheme=.*/  finish_scheme=1/" $OPTIONS
            sed -i "s/^  reset_scheme=.*/  reset_scheme=0/" $OPTIONS
        elif [ $SCHEME -eq $NOFINISH_PRO_EZ ]; then
            RESULT_PATH=${RESULT_DIR_PATH}/${WORKLOAD_TYPE}_NOFINISH_PRO_EZ.txt
            OPTIONS=/home/jaewan/연구/YCSB-cpp/rocksdb/zlsm_motivation.ini
            sed -i "s/^  finish_scheme=.*/  finish_scheme=2/" $OPTIONS
            sed -i "s/^  reset_scheme=.*/  reset_scheme=0/" $OPTIONS
        elif [ $SCHEME -eq $FINISH_PRO_EZ ]; then
            RESULT_PATH=${RESULT_DIR_PATH}/${WORKLOAD_TYPE}_FINISH_PRO_EZ.txt
            OPTIONS=/home/jaewan/연구/YCSB-cpp/rocksdb/zlsm_motivation.ini
            sed -i "s/^  finish_scheme=.*/  finish_scheme=3/" $OPTIONS
            sed -i "s/^  reset_scheme=.*/  reset_scheme=0/" $OPTIONS
        elif [ $SCHEME -eq $FINISH_PRO_CB1_EZ ]; then
            RESULT_PATH=${RESULT_DIR_PATH}/${WORKLOAD_TYPE}_FINISH_PRO_CB1_EZ.txt
            OPTIONS=/home/jaewan/연구/YCSB-cpp/rocksdb/zlsm_motivation.ini
            sed -i "s/^  finish_scheme=.*/  finish_scheme=4/" $OPTIONS
            sed -i "s/^  reset_scheme=.*/  reset_scheme=0/" $OPTIONS
        elif [ $SCHEME -eq $FINISH_PRO_CB2_EZ ]; then
            RESULT_PATH=${RESULT_DIR_PATH}/${WORKLOAD_TYPE}_FINISH_PRO_CB2_EZ.txt
            OPTIONS=/home/jaewan/연구/YCSB-cpp/rocksdb/zlsm_motivation.ini
            sed -i "s/^  finish_scheme=.*/  finish_scheme=5/" $OPTIONS
            sed -i "s/^  reset_scheme=.*/  reset_scheme=0/" $OPTIONS    
        else  
            echo "error"
        fi

        if [ -f ${RESULT_PATH} ]; then
            echo "already $RESULT_PATH exists"
            sleep 5
            continue
        fi

        while : 
        do
            sudo /home/jaewan/zone_reset_all 0 904 > /home/jaewan/연구/ATC_testdata/tmp/reset_log
            sudo rm -rf /home/jaewan/연구/ATC_testdata/log
            sudo mkdir -p /home/jaewan/연구/ATC_testdata/log
            echo "mq-deadline" | sudo tee /sys/block/${DEV}/queue/scheduler
            
            sudo /home/jaewan/연구/EZC/rocksdb/plugin/zenfs/util/zenfs mkfs --force --enable_gc \
            --zbd=${DEV} --aux_path=/home/jaewan/연구/ATC_testdata/log > /home/jaewan/연구/ATC_testdata/tmp2

            echo ${RESULT_PATH}
            sudo cp ${OPTIONS} /home/jaewan/연구/ATC_testdata/log/zenfsoptions.ini

            sudo /home/jaewan/연구/YCSB-cpp/ycsb -load -db rocksdb -P workloads/workload_${WORKLOAD_TYPE} -P rocksdb/rocksdb.properties -s > ${RESULT_DIR_PATH}/tmp
            
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

echo "All done."