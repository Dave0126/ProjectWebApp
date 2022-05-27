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
1. `dao` is  the entity class to operate `CRUD` the database
2. `domain` corresponds to the interface of the entity class
3. `exception` custom exception
4. `filter` filters request and response information:
   - `AutoLoginFilter` : Filter for automatic login and control of user login (i.e. only allowed multi-IP, single user login)
   - `CharacterFilter` : Filter that control the encoding of the entire website
   - `LoginFiler` : Filter that intercepts login requests for the same session
   - `NoCacheFilter` : Filter that inform browser do not use cache. Prevent the user from logging out and returning to the logged in state by pressing the back button.
5. `listener` monitor client requests, server operations, etc. Through the listener, some actions can be triggered automatically
   - `MyServletRequestListener` : Monitor whether the current `sessionId` exists in the `userList`
   - `OnlineUserListener` : Monitor the number of current online users
   - `WebContextListener` : Monitor the life cycle of a web project
6. `service` responsible for writing business logic
7. `web.servlet.client` client servlet package
8. `web.servlet.management` servlet package for administrator

### How to start?
1. Download the zip and decompress it directly or install git and execute the clone command
```
git clone git@github.com:Dave0126/ProjectWebApp.git
```
2. Use IDEA to open the project, configure jdk, tomcat and the required jar package. The jar package that the project depends on is in the `web/WEB-INF/lib` folder.
3. Open your app in managing DB (for example, Navicat), create a database named `moviesdata` , copy the file content in `moviesdata.sql` and run.
4. Modify the database-related content in `/src/c3p0-config.xml`.
```xml
    <property name="user">root</property>
    <property name="password">root</property>
```

## UPDATE LOG


### 2022.4.24 Guohao

Completed the development of the back-end program framework, and the test results were good



### 2022.4.29 Guohao

1. Used the bootstrap framework to build the front-end page, and the basic framework was formed
2. Completed the development of the servlet to deal with basic requests and responses

#### Next step:

1. Improve the function, enrich the page, and test the function
2. ......

### 2022.5.1 Guohao

1. Fix the problem about Searching by movie's name;
3. Update the DB (`moviesdata.sql`); 

#### BUGS to be fixed
1. When clicking on the `detail` page of a movie with comments, the page doesn't go home and comes out again; this problem does not occur for movies without comments;
2. On `category` pages, text encoding issues except first page;
3. Rewrite the DB (`moviesdata.sql`);
4. ...



### 2022.05.13 Guohao

1. Finish the management page for `admin`, finish `add a movie`, `delete a movie`, `search by name` and `modify the movie information`.

#### BUGS to be fixed

1. When clicking on the `detail` page of a movie with comments, the page doesn't go home and comes out again; this problem does not occur for movies without comments;
2. On `category` pages, text encoding issues except first page;
3. Rewrite the DB (`moviesdata.sql`);



### 2022.05.20 Guohao

1. Fixed the issue that the details page could not display comments
2. Added the filter to control the encoding of the entire website, in order to fix the issue about garbled. Does NOT work neither.

#### BUGS to be fixed

1. On `category` pages, text encoding issues except first page;
2. Rewrite the DB (`moviesdata.sql`)
3. ......

### 2022.05.25 Guohao

Draw project structure diagram and database schema diagram