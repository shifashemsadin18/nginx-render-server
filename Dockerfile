FROM nginx:alpine

# Xray (VLESS Core) ለማውረድ እና ለመጫን curl እና unzip እንጭናለን
RUN apk add --no-cache curl unzip

# የ Xray የቅርብ ጊዜውን ፋይል ከ GitHub እናወርዳለን
RUN curl -L -o xray.zip https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip && \
    unzip xray.zip xray -d /usr/local/bin/ && \
    chmod +x /usr/local/bin/xray && \
    rm xray.zip

# ማስተካከያ (Config) ማውጫዎችን መፍጠር
RUN mkdir -p /etc/xray /var/log/xray

# የራሳችንን የማስተካከያ ፋይሎች ኮፒ ማድረግ
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY config.json /etc/xray/config.json
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

# Render የሚሰጠውን ፖርት ተቀብሎ ሁለቱንም (Nginx እና Xray) በጋራ ማስጀመር
CMD ["/entrypoint.sh"]
