The OpenShift `jbossas` cartridge documentation can be found at:

https://github.com/openshift/origin-server/tree/master/cartridges/openshift-origin-cartridge-jbossas/README.md

# OpenShift Database Demo App

This demo app assumes there is a MySQL database connected to the OpenShift app, and that at least the following SQL has been performed:

    CREATE DATABASE sample;
    USE sample;
    CREATE TABLE people (id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, name VARCHAR(255), bio TEXT);
    INSERT INTO people (name, bio) VALUES ('Len', 'Goofy-looking Professor');
    SELECT * FROM people;

The Database Sample is reached via /dbsample.jsp on the web container.