
echo "Building saiku-core"
cd saiku-core
call mvn clean install
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
call mvn clean package install:install-file -Dfile=target/saiku-ui-2.6.1-SNAPSHOT.war  -DgroupId=org.saiku -DartifactId=saiku-ui -Dversion=2.6.1-SNAPSHOT -Dpackaging=war
echo "Building saiku-server"
cd ..\saiku-server
call mvn clean package
@rem echo "Building saiku-bi-platform-plugin"
@rem cd ..\saiku-bi-platform-plugin
@rem call mvn clean package
@rem echo "Building saiku-bi-platform-plugin-p5"
@rem cd ..\saiku-bi-platform-plugin-p5
@rem call mvn clean package
