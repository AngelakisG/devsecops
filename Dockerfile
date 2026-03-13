FROM nginxinc/nginx-unprivileged:stable-alpine

# 1. Γινόμαστε root προσωρινά για να έχουμε δικαιώματα εγγραφής
USER root

# 2. Δημιουργούμε το αρχείο
RUN echo "<html><body><h1>Secure DevSecOps Lab</h1><p>Status: Hardened Image</p></body></html>" > /usr/share/nginx/html/index.html

# 3. Επιστρέφουμε στον ασφαλή χρήστη 'nginx' (απαραίτητο για το runtime!)
USER 101

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]