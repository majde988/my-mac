#!/bin/bash
echo "🚀 [1/5] تجهيز المجلدات الافتراضية..."
mkdir -p /tmp/mac_parts /tmp/macos_storage

echo "📥 [2/5] تحميل الأجزاء الأبدية من GitHub Releases..."
gh release download v1.0 -D /tmp/mac_parts

echo "🧩 [3/5] تجميع وتأليف الأجزاء في ملف واحد..."
cat /tmp/mac_parts/mac_part_* > /tmp/macos_backup.tar.gz

echo "📦 [4/5] فك الضغط التلقائي ونظام الملفات..."
sudo tar -xzvf /tmp/macos_backup.tar.gz -C /tmp
sudo rm -rf /tmp/mac_parts /tmp/macos_backup.tar.gz

echo "🍏 [5/5] تشغيل الماك السحابي الأبدي بـ 2 Cores و 6G RAM..."
docker run -it --device=/dev/kvm --cap-add NET_ADMIN -p 8006:8006 -v /tmp/macos_storage:/storage -e VERSION=15 -e RAM_SIZE=6G -e DISK_SIZE=40G -e CPU_CORES=2 -e CPU_MODEL="Penryn" docker.io/dockurr/macos
