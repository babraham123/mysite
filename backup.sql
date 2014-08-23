-- MySQL dump 10.13  Distrib 5.1.73, for redhat-linux-gnu (x86_64)
--
-- Host: localhost    Database: mysitedb
-- ------------------------------------------------------
-- Server version	5.1.73

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_5f412f9a` (`group_id`),
  KEY `auth_group_permissions_83d7f98b` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_37ef4eb4` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add project',7,'add_project'),(20,'Can change project',7,'change_project'),(21,'Can delete project',7,'delete_project'),(22,'Can add link',8,'add_link'),(23,'Can change link',8,'change_link'),(24,'Can delete link',8,'delete_link'),(25,'Can add picture',9,'add_picture'),(26,'Can change picture',9,'change_picture'),(27,'Can delete picture',9,'delete_picture'),(28,'Can add video',10,'add_video'),(29,'Can change video',10,'change_video'),(30,'Can delete video',10,'delete_video'),(31,'Can add post',11,'add_post'),(32,'Can change post',11,'change_post'),(33,'Can delete post',11,'delete_post'),(34,'Can add table',12,'add_table'),(35,'Can change table',12,'change_table'),(36,'Can delete table',12,'delete_table'),(37,'Can add lab',13,'add_lab'),(38,'Can change lab',13,'change_lab'),(39,'Can delete lab',13,'delete_lab');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$12000$1Ans6k1L5mSy$mqd/3evJ+9qlWsQ5KxJZVMS9VzfSlr1ulJnvo+CzXSU=','2014-08-22 06:26:51',1,'babraham','','','babraham42@gmail.com',1,1,'2014-05-26 18:22:38');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_6340c63c` (`user_id`),
  KEY `auth_user_groups_5f412f9a` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_6340c63c` (`user_id`),
  KEY `auth_user_user_permissions_83d7f98b` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blogs_post`
--

DROP TABLE IF EXISTS `blogs_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blogs_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `body` longtext NOT NULL,
  `created` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogs_post`
--

LOCK TABLES `blogs_post` WRITE;
/*!40000 ALTER TABLE `blogs_post` DISABLE KEYS */;
INSERT INTO `blogs_post` VALUES (1,'How to setup Django + mysql + Apache','Below is a step by step account of how to set up a django (1.6) web application on a CentOS (6.4) server, running Apache (2.5) and python (2.6, 2.7)\r\n\r\n1. Login as root and set up a new user\r\n\r\nssh root@[ip address]\r\n	(you probably want to eventually disable root login)\r\n\r\nuseradd myuser\r\n	(create user)\r\n\r\npasswd myuser\r\n	(type in your password twice)\r\n\r\nusermod -a -G wheel myuser\r\n	(add user to a sudo enabled group)\r\n\r\nvisudo -f /etc/sudoers\r\n	(allow the wheel group to use sudo by editing the shudders file)\r\n	(press i, uncomment the 2nd line, then press ESC, shift ZZ)\r\n——-----------------\r\n## Allows people in group wheel to run all commands\r\n# %wheel        ALL=(ALL)       ALL\r\n------------------\r\n\r\nexit\r\n\r\n2. Login without typing in your password (not strictly necessary)\r\n(cite #7) http://wiki.centos.org/HowTos/Network/SecuringSSH\r\n\r\n(only your local machine)\r\nssh-keygen -t rsa\r\n	(generate public/private key)\r\n\r\nchmod 700 ~/.ssh\r\nchmod 600 ~/.ssh/id_rsa\r\n	(set permissions on your private key)\r\n\r\nscp ~/.ssh/id_rsa.pub myuser@[ip address]:/home/myuser\r\n	(copy your public key onto remote server)\r\n\r\nssh myuser@[ip address]\r\n	(on remote machine)\r\n\r\nmkdir ~/.ssh\r\ntouch ~/.ssh/authorized_keys\r\n	(create if they don\'t already exist)\r\n\r\ncat id_rsa.pub >> ~/.ssh/authorized_keys\r\nrm id_rsa.pub\r\n	(add public key to authorized list)\r\n\r\nchmod 700 ~/.ssh\r\nchmod 600 ~/.ssh/authorized_keys\r\n\r\n3. Install necessary packages. Since this is for CentOS, we yum.\r\n(cite) http://itekblog.com/django-centos-6-4/\r\n\r\ncat /etc/redhat-release\r\n	(check centos version. these cmds are for centos 6.4)\r\n\r\nsu\r\ncd /opt/\r\nwget http://mirrors.nl.eu.kernel.org/fedora-epel/6/i386/epel-release-6-8.noarch.rpm\r\nrpm -Uvh epel-release-6-8.noarch.rpm\r\nrm epel-release-6-8.noarch.rpm -f\r\n	(add the EPEL repositories to get Django)\r\n\r\nyum upgrade\r\nyum install python\r\n	(should be 2.6.6)\r\nyum install sqlite\r\nyum install mod_wsgi\r\nyum install mysql mysql-server\r\n\r\nyum install python-pip\r\npip install Django==1.6\r\n	(1.6 or whatever version you want)\r\nyum -y install mysql-devel\r\nyum install MySQL-python\r\n\r\n\r\npython\r\n>>> import django\r\n>>> print django.get_version()\r\n>>> quit()\r\n	(test to see if it downloaded properly)\r\nexit \r\n	(out of su)\r\n\r\n4. Django\r\n\r\ndjango-admin.py startproject mysite\r\ncd mysite\r\n\r\n(Add all of application specific code. For beginners, use this tutorial)\r\n(cite) https://docs.djangoproject.com/en/1.6/intro/tutorial01/\r\n\r\n5. Set up mod_wsgi (A python library for Apache). For testing, you can skip this and just use the development server that comes with django (instead of Apache).\r\n\r\nsu\r\nemacs /etc/httpd/conf.d/wsgi.conf\r\n	(integrate django and apache)\r\n\r\n----------------------\r\nLoadModule wsgi_module modules/mod_wsgi.so\r\n\r\n<VirtualHost *:80>\r\n  ServerName www.mywebsite.com\r\n  ServerAlias mywebsite.com\r\n  ServerAdmin webmaster@mywebsite.com\r\n\r\n  Alias /static/admin/ /usr/lib/python2.6/site-packages/django/contrib/admin/static/admin/\r\n  Alias /robots.txt /home/username/mysite/static/robots.txt\r\n  Alias /favicon.ico /home/username/mysite/static/favicon.ico\r\n  AliasMatch ^/([^/]*\\.css) /home/username/mysite/static/styles/$1\r\n\r\n  Alias /media/ /home/username/mysite/media/\r\n  <Directory /home/username/mysite/media>\r\n    Order deny,allow\r\n    Allow from all\r\n  </Directory>\r\n\r\n  Alias /static/ /home/username/mysite/static/\r\n  <Directory /home/username/mysite/static>\r\n    Order deny,allow\r\n    Allow from all\r\n  </Directory>\r\n\r\n#  WSGIDaemonProcess mywebsite.com python-path=/home/username/mysite:/usr/lib/python2.6/\r\n#  WSGIProcessGroup mywebsite.com\r\n\r\n  WSGIScriptAlias / /home/username/mysite/mysite/wsgi.py\r\n\r\n  <Directory /home/username/mysite/mysite>\r\n    <Files wsgi.py>\r\n#      WSGIProcessGroup mywebsite.com\r\n      Order allow,deny\r\n      Allow from all\r\n    </Files>\r\n  </Directory>\r\n\r\n</VirtualHost>\r\n----------------------\r\n	(this was especially tricky, so I included the entire file)\r\n\r\napachectl start\r\napachectl stop\r\napachectl restart\r\nhttpd -v\r\n	(apache commands)\r\n	(restart Apache after changing config files)\r\n\r\nemacs /var/www/html/index.html\r\n	(test apache)\r\n\r\n6. Create a mysql database (or skip this and use mysqlite)\r\n\r\nchkconfig --levels 235 mysqld on\r\n/etc/init.d/mysqld start\r\nmysql_secure_installation\r\n	(get mysql working, choose a password)\r\n\r\nmysql -u root -p\r\n>> create database mysitedb;\r\n>> GRANT ALL PRIVILEGES ON mysitedb.* To \'user\'@\'localhost\' IDENTIFIED BY \'password\';\r\n>> quit;\r\n	(create a new mysql user)\r\n\r\nexit (su)\r\nemacs ~/mysite/mysite/settings.py\r\n	(add the details to your settings file)\r\n\r\n--------------------\r\nALLOWED_HOSTS = [\'my.server.ip.address\']\r\n\r\nDATABASES = {\r\n    \'default\': {\r\n        # Add \'postgresql_psycopg2\', \'postgresql\', \'mysql\', \'sqlite3\' or \'oracle\'.                                        \r\n        \'ENGINE\': \'django.db.backends.mysql\',\r\n        \'NAME\': \'mysitedb\',\r\n        \'USER\': \'mysiteuser\',\r\n        \'PASSWORD\': \'password\',\r\n        \'HOST\': \'\',\r\n        \'PORT\': \'\',\r\n    }\r\n}\r\n\r\nTEMPLATE_DIRS = (\r\n    os.path.join(BASE_DIR, \"templates\"),\r\n)\r\n--------------------\r\n	(add snippets)\r\n	(each app must have a subdirectory for its templates)\r\n\r\ncd ~/mysite/\r\npython manage.py syncdb\r\n	(create Djago super user too)\r\npython manage.py sql [name of app] (if you have any apps)\r\npython manage.py syncdb\r\n	(have python create mysql tables)\r\n\r\npython manage.py runserver\r\n	(start django server if using development server, not apache)\r\n\r\nsudo apachectl restart\r\n	(or, if that fails try this version)\r\n	/sbin/service httpd restart\r\n\r\n7. If you get 403 permission denied errors\r\n\r\nemacs mysite/wsgi.py\r\n\r\n______________________\r\nimport sys\r\nsys.path.append(\'/home/username\')\r\nsys.path.append(\'/home/username/mysite\')\r\n______________________\r\n	(add snippet to the top of the file)\r\n\r\n\r\n(Restart apache and check website)\r\n\r\n(cite) http://blog.endpoint.com/2010/02/selinux-httpd-modwsgi-26-rhel-centos-5.html\r\n	(problems with SELinux)\r\n\r\nsu\r\nsetsebool -P httpd_can_network_connect on\r\nsetsebool -P httpd_enable_homedirs on\r\nsetsebool -P httpd_can_sendmail on\r\nrestorecon -vR /etc/httpd\r\n\r\n\r\n(Restart apache and check website)\r\n\r\n(cite) http://code.google.com/p/modwsgi/wiki/WhereToGetHelp?tm=6#Conference_Presentations\r\n	(config problems on CentOS)\r\n\r\nchmod o+rx /home/username/\r\nchmod o+rx /home/username/mysite/\r\nchmod o+rx /home/username/mysite/mysite/\r\nchmod o+rx /home/username/mysite/mysite/wsgi.py\r\nrestorecon -vR /etc/httpd\r\n\r\n(Restart apache and check website)\r\n\r\nexit\r\n','2013-08-01'),(2,'Setup Gunicorn + Nginx + Upstart for Django','sudo pip install gunicorn\r\n\r\nsudo yum install nginx\r\n\r\nlscpu | grep \'^CPU(s)\'\r\n	(record the number of CPUs, use that for the number of worker_processes)\r\n\r\nvi /etc/nginx/nginx.conf\r\n———————————————————\r\nuser              nginx;\r\nworker_processes  1;\r\n———————————————————\r\n	(set the number of worker_processes and the user to run as)\r\n\r\nvi /etc/nginx/conf.d/mysite.conf\r\n———————————————————\r\n# virtual host using mix of IP-, name-, and port-based configuration\r\n# from the django app, mysite, running on gunicorn\r\n\r\nserver {\r\n    listen       80;\r\n#    listen       someip:8080;\r\n    server_name  sitename.com;\r\n\r\n    access_log  /var/log/nginx/mysite.log;\r\n\r\n    location / {\r\n        proxy_set_header Host $http_host;\r\n        proxy_set_header X-Forwarded-Host $server_name;\r\n        proxy_set_header X-Real-IP $remote_addr;\r\n        proxy_pass http://127.0.0.1:8001;\r\n    }\r\n\r\n    location /media/ {\r\n        root /home/username/mysite/media;\r\n    }\r\n\r\n    location /static/ {\r\n        root /home/username/mysite/static;\r\n    }\r\n\r\n    location /admin/media/ {\r\n        # this changes depending on your python version\r\n        root /usr/lib/python2.6/site-packages/django/contrib;\r\n    }\r\n\r\n    error_page   500 502 503 504  /home/username/mysite/static/50x.html;\r\n}\r\n———————————————————\r\n\r\nsudo nginx -s reload\r\nsudo service nginx restart\r\n	(start up nginx)\r\n\r\nsudo yum install upstart\r\n\r\nvi /etc/init/mysite.conf\r\n——————————————————\r\ndescription \"My website - mysite\"\r\nstart on runlevel [2345]\r\nstop on runlevel [06]\r\nrespawn\r\nrespawn limit 10 5\r\n\r\nscript\r\n                NAME=mysite\r\n                PORT=8001\r\n                NUM_WORKERS=2\r\n                TIMEOUT=120\r\n                USER=username\r\n                GROUP=wheel\r\n                LOGFILE=/var/log/gunicorn/$NAME.log\r\n                LOGDIR=$(dirname $LOGFILE)\r\n                test -d $LOGDIR || mkdir -p $LOGDIR\r\n                cd /home/$USER/$NAME\r\n                exec gunicorn_django \\\r\n                         -w $NUM_WORKERS -t $TIMEOUT \\\r\n                        --user=$USER --group=$GROUP --log-level=debug \\\r\n                        --name=$NAME -b 127.0.0.1:$PORT \\\r\n                        --log-file=$LOGFILE 2>>$LOGFILE\r\nend script\r\n———————————————————— \r\n\r\nsudo start mysite\r\n','2014-03-01'),(3,'Install Pandoc','Pandoc is requirement for Nbconvert, a useful iPython library that allows you to convert ipython notebooks into various formats. The formats include pdf, html, even latex. Pandoc is the core document converter library and is written in Haskell, so its a bit difficult to install. \r\n\r\nhttp://ipython.org/ipython-doc/rel-1.0.0/interactive/nbconvert.html\r\n\r\nsudo yum install gcc\r\nsudo wget http://sherkin.justhub.org/el6/RPMS/x86_64/justhub-release-2.0-4.0.el6.x86_64.rpm\r\nsudo rpm -ivh --replacepkgs justhub-release-2.0-4.0.el6.x86_64.rpm\r\nsudo yum install haskell\r\nexport PATH=/usr/hs/bin:~/.cabal/bin:$PATH\r\ncabal update\r\ncabal install cabal-dev\r\ncabal install pandoc\r\n','2014-02-01'),(4,'Logging in python','Often times you want to log errors and debugging information in a log file. This is especially helpful for scripts that take a long time to run or run on a reoccurring basis. Below are some helpful hints and code snippets on how to do this in Python.\r\n\r\nInclude this code at the top of your script as a global variable. You can also use the same code to log info from helper scripts and imported libraries.\r\n\r\nimport logging\r\nlogger = logging.getLogger(__name__)\r\n\r\nIn your script\'s main function (the one that executes all of your code), you need to set the basic configuration params of the logger. This should only be called once. Set the name of the log file, formatting, etc. I like to call the log file the name of my main script, using sys.argv (remember to import sys)\r\n\r\nif __name__ == \"__main__\":\r\n    logname = sys.argv[0][:-3] + \".log\"\r\n    logging.basicConfig(level=logging.DEBUG, filename=logname, format=\'%(asctime)s %(levelname)s: %(name)s: %(message)s\')\r\n\r\nFinally, you can log messages to your log file in any .py file where you have initialized the logger object. \r\n\r\ndef foo():\r\n    logger.debug(\"Hello, world\")\r\n\r\nLog levels are a clever way to organize your log files. Typically you want a lot more information while debugging than while in production. Thus, you can send very description, long messages as DEBUG messages and shorter ones as INFO messages. Then you specify which log level you want when or set the configuration params. This determines which messages actually get written to your log file. The cool thing is that the log level X also gives you all of the log levels below X. So a log level of WARNING writes WARNING, ERROR, and CRITICAL messages to the log file. \r\n\r\nDEBUG: Detailed information, typically of interest only when diagnosing problems.\r\nINFO: Confirmation that things are working as expected.\r\nWARNING: An indication that something unexpected happened, or indicative of some problem in the near future (e.g. ‘disk space low’). The software is still working as expected.\r\nERROR: Due to a more serious problem, the software has not been able to perform some function.\r\nCRITICAL: A serious error, indicating that the program itself may be unable to continue running.\r\nHow to catch Exceptions\r\n\r\nCertain commands are particularly error prone, like saving model objects in AnxPy. In that case, you want to catch and handle any exceptions, in order to prevent them from automatically terminating your program. You can catch all exceptions or only certain kinds. Here\'s an example:\r\n\r\ntry:\r\n    # risky code\r\n    my_creative.save()\r\nexcept Exception as e:\r\n    # failure\r\n    message = \"Creative \" + str(my_creative.id) + \" failed on save.\"\r\n    logger.info(message)\r\n    logger.exception(e)\r\nelse:\r\n    # success!\r\n    message = \"Creative \" + str(my_creative.id) + \" was saved.\"\r\n    logger.info(message)\r\n\r\n\r\nAdvanced: Log all exceptions\r\nInsert this code at the top of your main script in order to log all exceptions, regardless of type or where they occur. They will still interrupt your program, but now they are also sent to your log file. Also, you can now decide whether or not to write to the standard error stream, stderr (useful for cron jobs). \r\n\r\nimport logging, sys\r\nlogger = logging.getLogger(__name__)\r\n \r\ndef stderr_override(typeE, valueE, tracebackE):\r\n    typeE = \"\\n  Error Type: \" + str(typeE)\r\n    valueE = \"\\n  Error Value: \" + str(valueE)\r\n    tracebackE = \"\\n  Traceback: \" + \"    \".join(traceback.format_tb(tracebackE)) + \"\\n\"\r\n    messageE = typeE + valueE + tracebackE\r\n \r\n    logger.exception(messageE)\r\n    print >> sys.stderr, messageE\r\n \r\n# send any uncaught errors to the logs\r\nsys.excepthook = stderr_override','2013-11-01'),(5,'Intro to (Web) Programming','A friend of mine recently told me that she was interested in programming, but didn\'t know where to start. She had already taken an intro course, so she knew how to use if statements, for loops, etc. Still, she felt a large chasm between what she knew and professional code. I sent her a few notes:\r\n\r\n-------------------------\r\n\r\nDear qq,\r\n\r\nCode academy is a great resource. When I\'m starting something new, I usually do a few tutorials, and then try to complete a small project.\r\n\r\nFor beginners everyone recommends python. The syntax is very straightforward and it has all the basics. Get really comfortable with one language before you branch out.\r\n\r\nLately, I\'ve been interested in web development. I like it a lot, because you can see and interact with the end product. If you already have some experience, building a website is a really fun project.\r\n\r\nHere\'s the path I took over the course of many months:\r\nLearn html (basics)\r\nLearn styling with twitter bootstrap\r\nStart using a python framework (bottle.py or web.py)\r\nLearn a professional grade framework (django or zend)\r\n         (zend uses php and is a bit outdated, but its also the most common)\r\nHost your site on a remote server (probably Amazon EC2)\r\n\r\nAdvanced\r\nLearn Javascript\r\nLearn JQuery\r\nAdd dynamic elements to your site\r\n(This is the hardest part, what people will pay real money for)\r\n\r\nHope that helps!\r\n\r\nCheers,\r\nBereket','2013-06-10'),(6,'Raspberry Pi Setup','Raspberry Pi Setup\r\n(assuming you\'ve already bought the supporting components, like a power supply, wiki dongle, and ethernet cable.)\r\n\r\n(plug in SD card)\r\nopen disk utility and erase card. Set the name and the format to “MS-DOS (FAT)”\r\n\r\n(terminal)\r\ndiskutil list\r\n(find card folder, ex /dev/disk38)\r\ndiskutil unmountdisk /dev/disk38\r\n\r\n(download your pi OS image and cd to folder)\r\nsudo dd if=2014-06-20-wheezy-raspbian.img of=/dev/disk38 bs=2m\r\n(flash OS image onto card, if=source, of=target, bs=size)\r\n\r\n(plug in peripherals, like keyboard, ethernet cable, and power)\r\n\r\nifconfig (get ip address)\r\nnmap -sn 192.168.1.0/24\r\nssh pi@192.168.1.88\r\nusername= pi\r\npassword= raspberry\r\n(install mmap, locate pi on network, and ssh into it)\r\n\r\nsudo raspi-config\r\n(set password, OS size, locale, )\r\nusername= pi\r\npassword= typical\r\n\r\nstartx (for GUI)\r\n\r\nsudo apt-get update\r\nsudo apt-get upgrade\r\nsudo apt-get autoremove\r\n\r\n(wifi dongle setup)\r\nsudo cp /etc/wpa_supplicant/wpa_supplicant.conf /etc/wpa_supplicant/wpa_supplicant.conf.bak\r\nsudo nano /etc/wpa_supplicant/wpa_supplicant.conf\r\n(change your ssid/passwrd)\r\n------------\r\nctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev\r\nupdate_config=1\r\n\r\nnetwork={\r\n        ssid=\"your_ssid\"\r\n        psk=\"your_pass\"\r\n}\r\n------------\r\n\r\nsudo reboot\r\nnmap -sn 192.168.1.0/24\r\n(find ip address again)\r\nssh pi@192.168.1.56\r\n\r\n\r\n(shutdown command)\r\nsudo shutdown -h now','2014-07-01');
/*!40000 ALTER TABLE `blogs_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_6340c63c` (`user_id`),
  KEY `django_admin_log_37ef4eb4` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2014-05-26 19:05:35',1,7,'1','Computational Fluid Dynamics',1,''),(2,'2014-05-26 19:07:17',1,7,'2','Engine Analysis',1,''),(3,'2014-05-26 19:08:49',1,7,'3','Magnetic Fluids',1,''),(4,'2014-05-26 19:21:53',1,7,'4','Accelerating Cylinders',1,''),(5,'2014-05-26 19:25:12',1,7,'5','Posiedon Autonomous Robot',1,''),(6,'2014-05-26 19:31:03',1,7,'6','3D Volumetric Display',1,''),(7,'2014-05-26 19:36:02',1,7,'7','Web Development',1,''),(8,'2014-05-26 19:39:01',1,7,'8','Narrathon TV',1,''),(9,'2014-05-26 19:41:09',1,11,'1','How to setup Django + mysql + Apache',1,''),(10,'2014-05-26 19:46:17',1,11,'2','Setup Gunicorn + Nginx + Upstart for Django',1,''),(11,'2014-05-26 19:49:55',1,11,'3','Install Pandoc',1,''),(12,'2014-05-26 19:54:19',1,11,'4','Logging in python',1,''),(13,'2014-05-26 20:02:14',1,11,'5','Intro to (Web) Programming',1,''),(14,'2014-05-26 20:02:57',1,11,'5','Intro to (Web) Programming',2,'Changed body.'),(15,'2014-05-27 14:11:09',1,7,'8','Narrathon TV',2,'Changed embed for video \"Demo\". Changed embed for video \"Final Presentation\". Changed embed for video \"Website Traffic\".'),(16,'2014-05-27 14:11:29',1,7,'6','3D Volumetric Display',2,'Changed embed for video \"Project Summary\". Changed embed for video \"Letter P\".'),(17,'2014-05-27 14:11:41',1,7,'5','Posiedon Autonomous Robot',2,'Changed embed for video \"Obstacle Test\". Changed embed for video \"Arm Test\". Changed embed for video \"Line Scanning Camera\".'),(18,'2014-05-27 14:11:55',1,7,'4','Accelerating Cylinders',2,'Changed embed for video \"Simulation, Re=500, beta=1\". Changed embed for video \"Simulation, Re=100, beta=0\".'),(19,'2014-05-27 14:12:07',1,7,'1','Computational Fluid Dynamics',2,'No fields changed.'),(20,'2014-06-05 06:07:47',1,7,'3','Magnetic Fluids',2,'Added video \"Electromagnetic variation\".'),(21,'2014-06-05 06:08:02',1,7,'8','Narrathon TV',2,'Changed embed for video \"Demo\". Changed embed for video \"Final Presentation\". Changed embed for video \"Website Traffic\".'),(22,'2014-06-05 06:08:10',1,7,'7','Web Development',2,'No fields changed.'),(23,'2014-06-05 06:08:21',1,7,'6','3D Volumetric Display',2,'Changed embed for video \"Project Summary\". Changed embed for video \"Letter P\".'),(24,'2014-06-05 06:08:33',1,7,'4','Accelerating Cylinders',2,'Changed embed for video \"Simulation, Re=500, beta=1\". Changed embed for video \"Simulation, Re=100, beta=0\".'),(25,'2014-06-05 06:08:44',1,7,'1','Computational Fluid Dynamics',2,'Changed embed for video \"Forward Projection, Set 2\". Changed embed for video \"Backward Projection, Set 2\".'),(26,'2014-06-05 06:20:23',1,7,'5','Posiedon Autonomous Robot',2,'Added video \"Line Scanning Camera\". Changed embed and title for video \"Competition Day\". Changed embed and title for video \"Obstacle Test\". Changed embed and title for video \"Arm Test\".'),(27,'2014-06-05 06:25:12',1,7,'5','Posiedon Autonomous Robot',2,'Changed embed for video \"Competition Day\".'),(28,'2014-07-02 02:27:55',1,7,'9','Script Runner',1,''),(29,'2014-07-02 03:22:31',1,7,'10','Light Table',1,''),(30,'2014-07-02 03:22:44',1,7,'8','Narrathon TV',2,'No fields changed.'),(31,'2014-07-02 03:23:04',1,7,'7','Web Development',2,'No fields changed.'),(32,'2014-07-02 03:25:23',1,11,'6','Raspberry Pi Setup',1,''),(33,'2014-07-02 03:33:57',1,7,'10','Light Table',2,'Changed tech_skills. Changed address for picture \"interface1.png\".'),(34,'2014-07-02 03:36:16',1,7,'6','3D Volumetric Display',2,'Added link \"Source Code\".'),(35,'2014-07-02 03:36:37',1,7,'5','Posiedon Autonomous Robot',2,'Added link \"Sample Code\".'),(36,'2014-07-23 05:31:00',1,12,'1','Dev Table',1,''),(37,'2014-08-22 06:45:20',1,13,'1','Public IP',1,'');
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'log entry','admin','logentry'),(2,'permission','auth','permission'),(3,'group','auth','group'),(4,'user','auth','user'),(5,'content type','contenttypes','contenttype'),(6,'session','sessions','session'),(7,'project','projects','project'),(8,'link','projects','link'),(9,'picture','projects','picture'),(10,'video','projects','video'),(11,'post','blogs','post'),(12,'table','labs','table'),(13,'lab','labs','lab');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_b7b81f0c` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('npfw6d6twkjis3qdo65lgogjfuzr8oup','Y2ZlMmQ1ZGEwNTI5ZWMwZjg5ZmYwOTAxMjVjYTE0YzZlNzc1ZmQ0Nzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-07-16 02:09:44'),('8ckhdtzu8hdp3vwbslrwtwwbxa39vi4d','YTg1YWU5NzgxNTA1ODU4ZDY5ZmI4YWM1ZjRiZGU0ZWZhYThjNDEzNzp7fQ==','2014-06-19 06:25:23'),('po1053jwyok4idejw6em3q3qlhj78rge','Y2ZlMmQ1ZGEwNTI5ZWMwZjg5ZmYwOTAxMjVjYTE0YzZlNzc1ZmQ0Nzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-08-06 04:16:38'),('jqcwx8rvlq27uc5lm4ddjrrlx15f36tp','Y2ZlMmQ1ZGEwNTI5ZWMwZjg5ZmYwOTAxMjVjYTE0YzZlNzc1ZmQ0Nzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-09-05 06:26:51');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `labs_lab`
--

DROP TABLE IF EXISTS `labs_lab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `labs_lab` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `filename` varchar(100) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `icon_address` varchar(100) NOT NULL,
  `created` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `labs_lab`
--

LOCK TABLES `labs_lab` WRITE;
/*!40000 ALTER TABLE `labs_lab` DISABLE KEYS */;
INSERT INTO `labs_lab` VALUES (1,'Public IP','/static/publicip.html','Get the client\'s public IP address.','/media/test.png','2014-08-22');
/*!40000 ALTER TABLE `labs_lab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `labs_table`
--

DROP TABLE IF EXISTS `labs_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `labs_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `key` varchar(100) NOT NULL,
  `ip` char(39) NOT NULL,
  `port` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `labs_table`
--

LOCK TABLES `labs_table` WRITE;
/*!40000 ALTER TABLE `labs_table` DISABLE KEYS */;
INSERT INTO `labs_table` VALUES (1,'Dev Table','amazing1','68.173.83.103',8383);
/*!40000 ALTER TABLE `labs_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_link`
--

DROP TABLE IF EXISTS `projects_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `address` varchar(200) NOT NULL,
  `title` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `projects_link_37952554` (`project_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_link`
--

LOCK TABLES `projects_link` WRITE;
/*!40000 ALTER TABLE `projects_link` DISABLE KEYS */;
INSERT INTO `projects_link` VALUES (1,1,'http://goo.gl/MxFEB','Poster'),(2,1,'http://goo.gl/4fG9P','Report'),(3,2,'http://goo.gl/tnHEg','Report'),(4,3,'http://goo.gl/FHlhQ','Report'),(5,4,'http://goo.gl/Do1obW','Paper'),(6,4,'http://goo.gl/2i7ldi','Poster'),(7,4,'http://goo.gl/GdGruL','Powerpoint'),(8,5,'http://goo.gl/NLJtVc','Report'),(9,6,'http://goo.gl/zoFhBN','Poster'),(10,6,'http://goo.gl/xShl9r','Thesis'),(11,7,'https://github.com/babraham123/mysite','Source Code'),(12,9,'https://github.com/babraham123/script-runner','Source Code'),(13,10,'https://github.com/babraham123/light-table','Source Code'),(14,6,'https://github.com/babraham123/3d-display','Source Code'),(15,5,'https://github.com/babraham123/vex-robot','Sample Code');
/*!40000 ALTER TABLE `projects_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_picture`
--

DROP TABLE IF EXISTS `projects_picture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects_picture` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `address` varchar(200) NOT NULL,
  `title` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `projects_picture_37952554` (`project_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_picture`
--

LOCK TABLES `projects_picture` WRITE;
/*!40000 ALTER TABLE `projects_picture` DISABLE KEYS */;
INSERT INTO `projects_picture` VALUES (1,1,'ftle_contour.png','FTLE Contour'),(2,1,'ftle_graph.png','FTLE Graph'),(3,2,'engine_model_trans.png','Engine Model'),(4,3,'ferrofluid_setup.png','Experimental Setup'),(5,3,'ferrofluid_white_trans.png','Ferrofluid'),(6,4,'flow_field_trans.png','Flow Field'),(7,6,'3d_circles.jpg','Circles'),(8,7,'python-django.png','Django'),(9,10,'model1.png','Top view'),(10,10,'model2.png','Bottom view'),(11,10,'interface1.png','Website prototype');
/*!40000 ALTER TABLE `projects_picture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_project`
--

DROP TABLE IF EXISTS `projects_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `comp_date` datetime NOT NULL,
  `subtitle` varchar(200) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `tech_skills` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_project`
--

LOCK TABLES `projects_project` WRITE;
/*!40000 ALTER TABLE `projects_project` DISABLE KEYS */;
INSERT INTO `projects_project` VALUES (1,'Computational Fluid Dynamics','2011-12-10 12:00:00','Finite-core vortex array model and Lagrangian Coherent Structures','Most flying or marine animals either undulate or oscillate through fluid. One way to examine their propulsion is to simulate and numerically analyze the wake left downstream. For a flapping body, vortices are important structures in the wake that cause thrust and induce fluid flow. Our objective was to determine whether a simple vortex model could approximate the entire fluid system. To judge our results we utilized Lagrangian Coherent Structures analysis, a special mathematical technique. We found that the orientation of the vortices produced several interesting flow structures, such as internal streams.','This project required extensive numerical computation in Matlab in order to finely interpolate flow velocity, integrate fluid trajectories, calculate strain fields, and so on. Analysis of the flow structure required a deep understanding of the underlying mathematics. Moreover, I learned how to optimize my code in order to obtain reasonable processor times.'),(2,'Engine Analysis','2012-05-01 12:00:00','Opposed-Piston Opposed-Cylinder engine','The Opposed-Piston Opposed-Cylinder engine is a very new technology that is still in development, although prototypes have been built and plans made for pioneering the engine in a test vehicle. Given the media attention that this engine has produced, we wanted to research the technology ourselves and assess the benefits it would bring. Our primary objectives were to describe the mechanics of the OPOC engine, calculate various engine metrics, assess the environmental impact and compare its performance to a traditional vehicle.','Our analysis involved a classic application of thermodynamics, and to a lesser extent mechanics.'),(3,'Magnetic Fluids','2011-05-01 12:00:00','Pipe flow of ferrofluid under changing magnetoviscosity','Ferrofluid is a mixture of magnetic nanoparticles and kerosene. Under a magnetic field, the particles will rotate and align, changing the properties of the fluid as a whole. Pipe flow is an important problem in the transportation of fluids. In this investigation, we tested the effect of a magnetic field on ferrofluid flowing through a long, narrow pipe. More specifically, we used volumetric flow rate measurements to calculate the viscosity of ferrofluid in laminar pipe flow. We proved that under an alternating magnetic field the viscosity of ferrofluid will decrease, thus allowing it to flow more efficiently.','Our experimental setup was fairly complex, involving several pipes, pressure gauges and high voltage electronics.'),(4,'Accelerating Cylinders','2013-02-28 12:00:00','Simulation of unsteady flow over a 2D cylinder','Impulsively started and accelerating two-dimensional flows around a circular cylinder are simulated with the immersed boundary projection method. This study investigates the flow dynamics of acceleration at low Reynolds numbers, Re = O(100)-O(1000). The evolution of drag and wake geometry are examined in detail to provide insights into the effect of different velocity profiles. We observe a strong dependent on beta, the power of acceleration, and on the reference Reynolds number. In addition, travel distance is found to be an effective time scale in collapsing drag and wake length.','We had to manage hundreds of gigabytes worth of data and to algorithmically extract information about the wake geometry from large vector fields.'),(5,'Posiedon Autonomous Robot','2013-05-01 12:00:00','Developing a low cost, autonomous search and rescue robot','The robot created throughout the course of this semester is a search and rescue robot (SaRR), designed to pick up a 0.75 lb medical kit and then deliver it to an injured person. However, the task is not as straightforward as it sounds; there are many obstacles that this robot must overcome before it reaches the victim. First, it must navigate an obstacle course, complete with sharp turns, bumps, and debris. Then it must traverse a one-foot wall, which has a six-inch ledge halfway up the wall, completely under autonomous control. Once it passes over the wall, it should continue to move autonomously into a three-foot wide chute, and maneuver its way through the sharp 30degree bends without hitting the walls. Upon exiting the chute, it must then locate a bright light attached to a basket, indicating the person needing medical assistance. Still under autonomous control, it must then drive towards the light and drop the medical kit in the basket. All with a budget of $500.','Poseidon\'s design revolved around overcoming the largest obstacle: the wall. Large petal-shaped wheels were created out of HDP and lined with rubber such that, as it climbs the wall, the spokes act like teeth in a gear and propel the robot forward and over the wall. This concept of simplicity carried on through the design of the rest of the robot as well.'),(6,'3D Volumetric Display','2013-05-15 12:00:00','Open sourcing 3D display technology with a modular, low cost design','Swept-volume displays are a rapidly developing type of 3D display technology. They are more realistic than today\'s stereoscopic 3D screens, but are simpler and faster than pure holography. However, all commercial displays to date have cost tens of thousands of dollars, making them too expensive for everyday use. In 2012, two engineers at www.openvolumetric.org built a low cost swept-volume display with a helical screen, in the hopes of creating an open sourced design for people to follow. We aim to create a test-bed type system that will remove some of the complexity and bring the cost below $500. Our device is also used to evaluate OpenVolumetric\'s claim that volumetric displays can be made to appeal to small-time hobbyists and technologists. While utilizing the same helical screen and DLP projector as the Australian team, our design differs from theirs in several important respects. Hopefully, future tinkerers will expand on our work to further refine the system.','The project involved the design and construction of several electrical and one mechanical systems. Synchronization of the rotational speed and finding suitable materials for the projection surface were two particularly difficult problems.'),(7,'Web Development','2014-03-01 12:00:00','This website!','As part of my senior thesis project, I learned python to do some image manipulation. Over the summer, I decided to practice parseltongue by writing a Django-based website. Its been a really interesting experience, teaching me everything from unix file structure to apache configuration files. See some of my blog entries for detailed set up instructions.','Recently, I ported the entire project from a ubuntu-based Amazon EC2 instance to a Vritual CentOS server. I also upgraded from Django 1.4 to 1.6 and switched my web server from Apache to a Nignx/Gunicorn combination to help simplify the configuration. Finally, I’m using Upstart for process management and logging.'),(8,'Narrathon TV','2013-05-01 12:00:00','A semester-long entrepreneurship project','At the start of my senior year, I enrolled in EGR 495, or the Lean Launchpad. The goal of the class was to develop a viable entrepreneurial venture by the end of the semester. After a long exploratory period, my group settled on Narrathon TV, an online platform for interactive live video streaming. The main idea was that interactive features such as a Q&A stream would provide a unique value add to live video. We explored several business models and many use cases, including news corporations, health and wellness talks, conferences, music concerts, and sporting events.','Luckily, live streaming itself was already available through vendors like Youtube and Google Hangouts. For our minimum viable product, we made a website using Flask, Heroku servers, and Hangouts for the video streaming. '),(9,'Script Runner','2014-03-01 12:00:00','A web application for running arbitrary ipython notebooks','Script Runner is a python web application that can run arbitrary python code in a special read-only mode. This code is pulled from ipython notebooks, and is rendered as astatic html page. The general idea was to recreate an ipython notebook server, that is read-only and allows a set number of input parameters. The code is written with Tornado, using their native templating and web serving capabilities.','I create a web UI and an API for running the pre-loaded ipython notebooks. In addition, I included a method for setting input variables and receiving one output dataframe. This application was written for ipython 0.12. Unfortunately, the entire project was made somewhat obsolete by the release of ipython 1.2 and Runpy.'),(10,'Light Table','2014-07-01 12:00:00','An interactive, light emitting coffee table','Originally inspired by a hackaday article, the goal is to build a coffee table with embedded \"pixels\". These pixels would by 1x1 inch cells, each containing an individually controllable LED. The user would be able to set the brightness and color of each cell, depending on the user\'s input into a website or directly onto the glass surface. Some features are still being worked on (surface contact).','The project consisted of two main phases: the construction the wooden coffee table and the programming of the microprocessor for LED control and networking. The construction was fairly straightforward, but complicated by the fact that I was missing several key tools. In the end, I ended up borrowing some of the missing tools and improvising the rest. Microprocessor: I originally went with an arduino for simplicity but plan on upgrading to a raspberry pi in the near future. Controlling the LEDs was made easy using the fastSPI library. Communicating with the device was much more difficult. After some testing, I eventually turned the arduino into a WebSockets server. The chief advantages were low latency and the ability to connect multiple users simultaneously. I\'m still in the process of creating an intuitive UI, and developing the surface touch detector. I\'ll probably go with an advanced touch capacitance controller like the 3M MicroTouch.');
/*!40000 ALTER TABLE `projects_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_video`
--

DROP TABLE IF EXISTS `projects_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `embed` varchar(200) NOT NULL,
  `title` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `projects_video_37952554` (`project_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_video`
--

LOCK TABLES `projects_video` WRITE;
/*!40000 ALTER TABLE `projects_video` DISABLE KEYS */;
INSERT INTO `projects_video` VALUES (1,1,'https://www.youtube.com/embed/Vh-Pv2SaWu8','Forward Projection, Set 2'),(2,1,'https://www.youtube.com/embed/tx_Fp8k2F00','Backward Projection, Set 2'),(3,4,'https://www.youtube.com/embed/FoYJX3qhIgo','Simulation, Re=500, beta=1'),(4,4,'https://www.youtube.com/embed/0b91DJxQbcM','Simulation, Re=100, beta=0'),(5,5,'https://www.youtube.com/embed/AHvUBQvBC0o?start=130','Competition Day'),(6,5,'https://www.youtube.com/embed/N9HubC49_rg','Obstacle Test'),(7,5,'https://www.youtube.com/embed/qheu3QFLKfw','Arm Test'),(8,6,'https://www.youtube.com/embed/f8KBqajd2UQ','Project Summary'),(9,6,'https://www.youtube.com/embed/47PYvl_eDt8','Letter P'),(10,8,'https://www.youtube.com/embed/hoUf-EnrSFk','Demo'),(11,8,'https://www.youtube.com/embed/80UrNb5thLA','Final Presentation'),(12,8,'https://www.youtube.com/embed/OU6fopkwQSU','Website Traffic'),(14,5,'https://www.youtube.com/embed/rDAHs1C3XNw','Line Scanning Camera'),(13,3,'https://www.youtube.com/embed/4T7zi8Bg6cM','Electromagnetic variation'),(15,10,'https://www.youtube.com/embed/Kplg4UJpalU','Individually controllable LEDs');
/*!40000 ALTER TABLE `projects_video` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-08-22  5:05:01
