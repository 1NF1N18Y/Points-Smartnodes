#!/bin/bash
# use testnet settings,  if you need mainnet,  use ~/.pointscore/pointsd.pid file instead
points_pid=$(<~/.pointscore/testnet3/pointsd.pid)
sudo gdb -batch -ex "source debug.gdb" pointsd ${points_pid}
