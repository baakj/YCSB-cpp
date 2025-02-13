#!/bin/bash

# 환경 변수 값 목록
ZONE_VALUES=(64 30 20 10 7)
#ZONE_VALUES=(14 13)

# 실험 결과 경로
RESULT_DIR_PATH=/home/jaewan/ATC_testdata/YCSB_zns/36GB
OPTIONS=/home/jaewan/YCSB-cpp/rocksdb/zlsm_motivation.ini

# 디바이스 설정
DEV=nvme0n1




for ZONE_VALUE in "${ZONE_VALUES[@]}"; do
    export MAX_NR_OPEN_IO_ZONES=$ZONE_VALUE
    export MAX_NR_ACTIVE_IO_ZONES=$ZONE_VALUE

    echo "Running experiment with MAX_NR_OPEN_IO_ZONES=$MAX_NR_OPEN_IO_ZONES 

#and MAX_NR_ACTIVE_IO_ZONES=$MAX_NR_ACTIVE_IO_ZONES"
    
    # 결과 파일 경로 설정
    RESULT_PATH=${RESULT_DIR_PATH}/zone${ZONE_VALUE}.txt

    if [ -f ${RESULT_PATH} ]; then
        echo "Already exists: $RESULT_PATH"
        sleep 5
        continue
    fi

    while : ; do
        # 디바이스 초기화
        sudo -E /home/jaewan/zone_reset_all 0 64 > /home/jaewan/ATC_testdata/tmp/reset_log
        sudo rm -rf /home/jaewan/ATC_testdata/log
        sudo mkdir -p /home/jaewan/ATC_testdata/log
        echo "mq-deadline" | sudo tee /sys/block/${DEV}/queue/scheduler

        # ZenFS 파일 시스템 초기화
        sudo -E /home/jaewan/EZC/rocksdb/plugin/zenfs/util/zenfs mkfs --force --enable_gc \
        --zbd=${DEV} --aux_path=/home/jaewan/ATC_testdata/log > /home/jaewan/ATC_testdata/tmp2

        echo "Result path: ${RESULT_PATH}"
	sudo cp ${OPTIONS} /home/jaewan/ATC_testdata/log/zlsm_motivation.ini


        # YCSB 실행 및 결과 저장
        sudo -E /home/jaewan/YCSB-cpp/ycsb -load -db rocksdb -P workloads/workload_uniform \
        -P rocksdb/rocksdb.properties -s > ${RESULT_DIR_PATH}/tmp

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

echo "All experiments completed."
