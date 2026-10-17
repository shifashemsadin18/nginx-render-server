#!/bin/sh
# Render የሚሰጠውን ፖርት በ Nginx ውስጥ ማስተካከል
sed -i "s/listen  *80;/listen $PORT;/g" /etc/nginx/conf.d/default.conf

# Xray ኮርን ከጀርባ (Background) ማስጀመር
xray -config /etc/xray/config.json &

# Nginx ሰርቨርን ማስተናገድ
nginx -g 'daemon off;'
