
echo "Building saiku-core"
cd saiku-core
call mvn clean install -DskipTests
cd ..
echo "Building saiku-webapp"
cd saiku-webapp
call mvn clean install
@rem cd ..
@rem call git submodule init
@rem call git submodule update
echo "Building saiku-ui"
cd ..\saiku-ui
@rem call git checkout master
@rem call git pull
call mvn clean package install:install-file -Dfile=target/saiku-ui-2.5.war  -DgroupId=org.saiku -DartifactId=saiku-ui -Dversion=2.5 -Dpackaging=war
echo "Building saiku-server"
cd ..\saiku-server
call mvn clean package
@rem echo "Building saiku-bi-platform-plugin-util"
@rem cd ..\saiku-bi-platform-plugin-util
@rem call mvn clean install
@rem echo "Building saiku-bi-platform-plugin"
@rem cd ..\saiku-bi-platform-plugin
@rem call mvn clean package

del target\dist\saiku-server\tomcat\webapps\saiku\WEB-INF\lib\xercesImpl-2.5.0.jar
