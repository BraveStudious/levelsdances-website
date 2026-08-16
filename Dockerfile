FROM nginx:alpine

# Copy the static site into nginx's web root
COPY . /usr/share/nginx/html

# Render (and most platforms) expect the app to listen on the PORT they inject.
# nginx defaults to 80, so we override the default config to use $PORT at runtime.
COPY nginx.conf.template /etc/nginx/templates/default.conf.template

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
