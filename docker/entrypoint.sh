#!/bin/bash

/usr/sbin/nginx

export LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu/

PY=/root/miniconda3/envs/py11/bin/python

function task_exe(){
    while [ 1 -eq 1 ];do
      $PY rag/svr/task_executor.py $1 $2;
    done
}

WS=1
for ((i=0;i<WS;i++))
do
  task_exe $i $WS & # (0,1)  # 传了俩参数进入task_exe, 并执行了两次
done

while [ 1 -eq 1 ];do
    $PY api/ragflow_server.py
done

wait; # wait 命令用于等待所有后台进程结束
