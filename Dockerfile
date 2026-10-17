FROM nginx:alpine

# የሰራነውን index.html ፋይል ወደ Nginx ማውጫ ኮፒ እናደርገዋለን
COPY index.html /usr/share/nginx/html/index.html

# Render የሚሰጠውን PORT ተቀብሎ Nginx እንዲሰራ ማድረግ
CMD sh -c "sed -i 's/listen  *80;/listen '\"$PORT\"';/g' /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'"
