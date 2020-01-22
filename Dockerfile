FROM node:alpine
MAINTAINER Premson

RUN apk update && apk upgrade
# Install the application
#ADD package.json /app/package.json
RUN npm install
ADD HelloWorld.js HelloWorld.js
ENV WEB_PORT 3001
EXPOSE  3001

# Vulnerability Advisor : Fix PASS_MAX_DAYS, PASS_MIN_DAYS and PASS_MIN_LEN, common-password
# RUN mv -f /etc/login.defs /etc/login.defs.orig
# RUN sed 's/^PASS_MAX_DAYS.*/PASS_MAX_DAYS 90/' /etc/login.defs.orig > /etc/login.defs
# RUN grep -q '^PASS_MIN_DAYS' /etc/login.defs && sed -i 's/^PASS_MIN_DAYS.*/PASS_MIN_DAYS 1/' /etc/login.defs || echo 'PASS_MIN_DAYS 1\n' >> /etc/login.defs
# RUN grep -q '^PASS_MIN_LEN' /etc/login.defs && sed -i 's/^PASS_MIN_LEN.*/PASS_MIN_LEN 8/' /etc/login.defs || echo 'PASS_MIN_LEN 9\n' >> /etc/login.defs
# RUN grep -q '^password.*required' /etc/pam.d/common-password && sed -i 's/^password.*required.*/password    required            pam_permit.so minlen=9/' /etc/pam.d/common-password || echo 'password    required            pam_permit.so minlen=9' >> /etc/pam.d/common-password
# Vulnerability Advisor : Temporarily remove a specific <package> that was discovered vulnerable
# RUN dpkg --purge --force-all <package>

# Define command to run the application when the container starts
CMD ["node", "HelloWorld.js"]
