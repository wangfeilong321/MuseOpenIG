#-------------------------------------------------
#
# Project created by QtCreator 2015-03-29T20:22:26
#
#-------------------------------------------------

QT -= core gui

CONFIG += silent

TARGET = IgPlugin-Bullet
TEMPLATE = lib

DEFINES += IGPLUGINBULLET_LIBRARY

SOURCES += igpluginbullet.cpp

LIBS += -losg -losgDB -losgViewer -lOpenThreads -losgShadow -losgAnimation -lIgCore -lIgPluginCore

INCLUDEPATH += ../
DEPENDPATH += ../

unix {
    !mac:contains(QMAKE_HOST.arch, x86_64):{
        DESTDIR = /usr/local/lib64/igplugins
        target.path = /usr/local/lib64/igplugins
    } else {
        DESTDIR = /usr/local/lib/igplugins
        target.path = /usr/local/lib/igplugins
    }
    message(Libs will be installed into $$DESTDIR)

    INSTALLS += target

    INCLUDEPATH += /usr/local/include
    DEPENDPATH += /usr/local/include

    INCLUDEPATH += /usr/local/include/bullet
    DEPENDPATH += /usr/local/include/bullet

    INCLUDEPATH += /usr/local/lib64
    DEPENDPATH += /usr/local/lib64

    LIBS += -lIgLib-Bullet

    # library version number files
    exists( "../openig_version.pri" ) {

	include( "../openig_version.pri" )
	isEmpty( VERSION ){ error( "bad or undefined VERSION variable inside file openig_version.pri" )
	} else {
	message( "Set version info to: $$VERSION" )
	}

    }
    else { error( "could not find pri library version file openig_version.pri" ) }

    # end of library version number files
}


win32-g++:QMAKE_CXXFLAGS += -fpermissive -shared-libgcc -D_GLIBCXX_DLL

win32 {

    OSGROOT = $$(OSG_ROOT)
    isEmpty(OSGROOT) {
        message(\"OpenSceneGraph\" not detected...)
    }
    else {
        message(\"OpenSceneGraph\" detected in \"$$OSGROOT\")
        INCLUDEPATH += $$OSGROOT/include
        LIBS += -L$$OSGROOT/lib
    }
    OSGBUILD = $$(OSG_BUILD)
    isEmpty(OSGBUILD) {
        message(\"OpenSceneGraph build\" not detected...)
    }
    else {
        message(\"OpenSceneGraph build\" detected in \"$$OSGBUILD\")
        DEPENDPATH += $$OSGBUILD/lib
        INCLUDEPATH += $$OSGBUILD/include
        LIBS += -L$$OSGBUILD/lib
    }

    exists( C:/Program Files/osgBullet ) {
        OSGBULLETSROOT = "C:\Program Files\osgBullet"
    }
    isEmpty(OSGBULLETSROOT) {
        message(\"osgBullets\" not detected...)
    }
    else {
        message(\"osgBullets\" detected in \"$$OSGBULLETSROOT\")
        INCLUDEPATH += $$OSGBULLETSROOT\include
#        LIBS += -L$$OSGBULLETSROOT
#        LIBS += -L$$OSGBULLETSROOT\lib
#        LIBS += -losgbCollision -losgbDynamics
    }
    BULLETSBUILD = $$(BULLETS_BUILD)
    isEmpty(BULLETSBUILD) {
        message(\"Bullets build\" not detected...)
    }
    else {
        message(\"Bullets build\" detected in \"$$BULLETSBUILD\")
        DEPENDPATH += $$BULLETSBUILD
        INCLUDEPATH += $$BULLETSBUILD\src
#        LIBS += -L$$BULLETSBUILD\BUILD\lib\release
#        LIBS += -lLinearMath -lBulletCollision -lBulletDynamics -lIgLib-Bullet
    }

    OPENIGBUILD = $$(OPENIG_BUILD)
    isEmpty (OPENIGBUILD) {
        OPENIGBUILD = $$IN_PWD/..
    }
    DESTDIR = $$OPENIGBUILD/lib
    DLLDESTDIR = $$OPENIGBUILD/bin/igplugins

    LIBS += -L$$OPENIGBUILD/lib
    LIBS += -lIgLib-Bullet

}

