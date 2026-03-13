# 1. Χρησιμοποιούμε την έκδοση 'unprivileged' και 'alpine' 
# Η alpine είναι πανάλαφρη και η unprivileged δεν τρέχει ως root
FROM nginxinc/nginx-unprivileged:stable-alpine

# 2. Προσθέτουμε Metadata (καλή πρακτική για SBOM)
LABEL maintainer="AngelakisG"
LABEL description="Secure Nginx Image for DevSecOps Lab"

# 3. Αντιγράφουμε το αρχείο μας (αντί για RUN echo) 
# Σημείωση: Στην unprivileged έκδοση, ο φάκελος είναι διαφορετικός
# και ο χρήστης nginx έχει ήδη δικαιώματα εκεί.
RUN echo "<html><body><h1>Secure DevSecOps Lab</h1><p>Status: Hardened Image</p></body></html>" > /usr/share/nginx/html/index.html

# 4. Αλλάζουμε τη θύρα σε 8080 
# Οι non-root χρήστες δεν επιτρέπεται να ανοίγουν θύρες κάτω από την 1024
EXPOSE 8080

# 5. Δεν χρειάζεται να αλλάξουμε χρήστη, η εικόνα 'unprivileged' 
# έχει ήδη ρυθμιστεί να τρέχει ως 'nginx' (UID 101)
USER nginx

CMD ["nginx", "-g", "daemon off;"]