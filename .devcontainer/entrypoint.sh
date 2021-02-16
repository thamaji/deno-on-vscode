#!/bin/bash
set -eu

# docker.sock から gid を取得して、docker グループを作成し、
# vscode ユーザーを所属させる
docker_group_id=$(ls -n /var/run/docker.sock | cut -d ' ' -f 4)
sudo groupadd --gid ${docker_group_id} docker
sudo usermod -aG docker vscode

# 無限待ち（vscode デフォルトの entrypoint と同じ方法で）
while sleep 1000; do :; done