#!/usr/bin/bash
set -o nounset -o errexit

echo --node-ip=${NODE_PRIVATE_IP} >> /etc/systemd/system/kubelet.service.d/10-kubeadm.conf
systemctl daemon-reload

eval $(cat /tmp/kubeadm_join)
systemctl enable docker kubelet