FROM nginx:alpine

# Just run Nginx in foreground
CMD ["nginx", "-g", "daemon off;"]

