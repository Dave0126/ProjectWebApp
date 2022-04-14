# Java Web Project: Movie Website

### Description
A Movie Website Based on Servlet+JSP

### Technical Stack
#### Software
- IntelliJ IDEA 2021.3.3 (Ultimate Edition)
- Navicat Premium 16.0.12
#### Frontend
- html
- css
- JavaScript
- BootStrap
- EChart (support for showing the graph in admin's page)
- JQuery
#### Backend
- JSP
- Servlet
- DataBase: MySQL 5.7.27
- Connect Pool: C3P0
- JDBC tools: Apache Commons DbUtils
- JDK: openjdk version "1.8.0_322"
- Tomcat: version 9.0.33



### Package
1. `dao` directly operates the database
2. `domain` corresponds to the entity class of the database table
3. `exception` custom exception
4. `filter` filter package
5. `listener` listener package
6. `service` handles various business logic packages
7. `utils` toolkit
8. `web.servlet.client` client servlet package
9. `web.servlet.management` servlet package for background management

### How to start?
1. Download the zip and decompress it directly or install git and execute the clone command
```
git clone git@github.com:Dave0126/ProjectWebApp.git
```
2. Use IDEA to open the project, configure jdk, tomcat and the required jar package.
3. Open your app in managing DB (for example, Navicat), create a database named `moviesdata` , copy the file content in `moviesdata.sql` and run.
4. Modify the database-related content in `/src/c3p0-config.xml`.
```xml
    <property name="user">root</property>
    <property name="password">root</property>
```