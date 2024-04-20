# Use the Tomcat image as the base image
FROM tomcat:10.0.0-M7-jdk11-openjdk

# Copy the war file to the webapps directory
COPY target/*.war /usr/local/tomcat/webapps/

# Expose the port number
EXPOSE 8080

# Start the Tomcat server
CMD ["catalina.sh", "run"]

