#!/bin/bash

# تحميل playit.gg
wget -O playit https://github.com/playit-cloud/playit-agent/releases/latest/download/playit-linux-amd64
chmod +x playit

# إدخال رمز المصادقة (Authtoken)
clear
echo "اذهب إلى: https://playit.gg/start"
read -p "الصق رمز المصادقة (Playit Authtoken): " PLAYIT_AUTH
./playit login --token "$PLAYIT_AUTH"

# تشغيل playit.gg في الخلفية
./playit &>/dev/null &

sleep 5

# التأكد من تشغيل playit
if pgrep -x "playit" > /dev/null; then
    echo "✅ Playit.gg يعمل بنجاح!"
else
    echo "❌ خطأ في تشغيل Playit.gg! يرجى إعادة المحاولة."
    exit 1
fi

# تشغيل Docker مع NoMachine
docker run --rm -d --network host --privileged --name nomachine-xfce4 \
    -e PASSWORD=123456 -e USER=user --cap-add=SYS_PTRACE --shm-size=1g \
    thuonghai2711/nomachine-ubuntu-desktop:windows10

# عرض معلومات NoMachine
clear
echo "NoMachine: https://www.nomachine.com/download"
echo "✅ تم الإعداد بنجاح!"
echo "👤 المستخدم: user"
echo "🔑 كلمة المرور: 123456"
echo "🌐 رابط الاتصال عبر Playit.gg:"
./playit status | grep -oP '(?<=tcp:\/\/).*'

# إبقاء الجلسة نشطة لمدة 12 ساعة
seq 1 43200 | while read i; do 
    echo -en "\r تشغيل .     $i s /43200 s"; sleep 0.1
    echo -en "\r تشغيل ..    $i s /43200 s"; sleep 0.1
    echo -en "\r تشغيل ...   $i s /43200 s"; sleep 0.1
    echo -en "\r تشغيل ....  $i s /43200 s"; sleep 0.1
    echo -en "\r تشغيل ..... $i s /43200 s"; sleep 0.1
    echo -en "\r تشغيل     . $i s /43200 s"; sleep 0.1
done
