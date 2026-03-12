# Χρησιμοποιούμε μια παλαιότερη έκδοση Nginx 
FROM nginx:1.23.1

# Δημιουργούμε μια απλή σελίδα HTML 
RUN echo "<html><body><h1>DevSecOps Lab</h1><p>Hello: [This is a static site]</p><p> di: [for di uoa]</p></body></html>" > /usr/share/nginx/html/index.html

# Εκθέτουμε τη θύρα 80 για να μπορεί να "σερβίρει" τη σελίδα
EXPOSE 80

# Ξεκινάμε τον Nginx
CMD ["nginx", "-g", "daemon off;"]