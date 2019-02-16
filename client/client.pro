TEMPLATE = app
TARGET = dynablaster

QT += core
QT += gui
QT += opengl
QT += network

OBJECTS_DIR=.obj
MOC_DIR=.moc

#DEFINES += INSPECT_SCENE

win32 {
   DEFINES += _USE_MATH_DEFINES=1
   DEFINES += SDL_WIN
   DEFINES += _CRT_SECURE_NO_WARNINGS
   LIBS += -lwinmm
   LIBS += -lopengl32
   RC_FILE = dynablaster.rc
}

unix:!macx {
   LIBS += -lasound
   DEFINES += _LINUX_
}

macx {
   LIBS += -L/usr/local/opt/sdl2/lib -framework CoreAudio -framework AudioToolbox
   DEFINES += __APPLE__
}

#QMAKE_CFLAGS_RELEASE += -Zi
#QMAKE_CXXFLAGS_RELEASE += -Zi
#QMAKE_LFLAGS_RELEASE += /DEBUG /OPT:REF

contains(QMAKE_TARGET.arch, x86_64) {
   LIBS += -L$${PWD}/lib64
} else {
   LIBS += -L$${PWD}/lib
}

LIBS += -lSDL2

DEPENDPATH += \
   ../shared \
   . \
   src \
   src/tools \
   src/engine/animation \
   src/engine/helper \
   src/engine/materials \
   src/engine/nodes \
   src/engine/render \
   src/game \
   src/image \
   src/math \
   src/menus \
   src/sound

INCLUDEPATH += .
INCLUDEPATH += src
INCLUDEPATH += src/framework
INCLUDEPATH += src/engine
INCLUDEPATH += src/game
INCLUDEPATH += src/joystick
INCLUDEPATH += src/menus
INCLUDEPATH += src/sound
INCLUDEPATH += ../shared
INCLUDEPATH += ../server/src
INCLUDEPATH += $$(QTDIR)/include/QtCore
INCLUDEPATH += $$(QTDIR)/include/QtGui
INCLUDEPATH += $$(QTDIR)/include/QtNetwork
INCLUDEPATH += $$(QTDIR)/include/QtOpenGL

HEADERS += \
    ../ai/astarmap.h \
    ../ai/astarnode.h \
    ../ai/astarpathfinding.h \
    ../ai/bombchainreaction.h \
    ../ai/botaction.h \
    ../ai/botbombaction.h \
    ../ai/botbombmapitem.h \
    ../ai/botcharacter.h \
    ../ai/botclient.h \
    ../ai/botconstants.h \
    ../ai/botfactory.h \
    ../ai/botgui.h \
    ../ai/bot.h \
    ../ai/botidleaction.h \
    ../ai/botmap.h \
    ../ai/botoption.h \
    ../ai/botplayerinfo.h \
    ../ai/botwalkaction.h \
    ../ai/pathfinding.h \
    ../ai/path.h \
    ../ai/protobot.h \
    ../ai/protobotinsults.h \
    ../ai/protobotmemory.h \
    ../server/src/collisiondetection.h \
    ../server/src/extrashakepackethandler.h \
    ../server/src/extraspawn.h \
    ../server/src/game.h \
    ../server/src/server.h \
    ../server/src/serverversion.h \
    ../shared/blockmapitem.h \
    ../shared/bombkickanimation.h \
    ../shared/bombmapitem.h \
    ../shared/bombpacket.h \
    ../shared/constants.h \
    ../shared/countdownpacket.h \
    ../shared/creategamedata.h \
    ../shared/creategamerequestpacket.h \
    ../shared/creategameresponsepacket.h \
    ../shared/detonationpacket.h \
    ../shared/errorpacket.h \
    ../shared/extramapitemcreatedpacket.h \
    ../shared/extramapitem.h \
    ../shared/extrashakepacket.h \
    ../shared/gameeventpacket.h \
    ../shared/gameinformation.h \
    ../shared/gameround.h \
    ../shared/gamestatspacket.h \
    ../shared/joingamerequestpacket.h \
    ../shared/joingameresponsepacket.h \
    ../shared/keypacket.h \
    ../shared/leavegamerequestpacket.h \
    ../shared/leavegameresponsepacket.h \
    ../shared/listgamesrequestpacket.h \
    ../shared/listgamesresponsepacket.h \
    ../shared/loginrequestpacket.h \
    ../shared/loginresponsepacket.h \
    ../shared/mapcreaterequestpacket.h \
    ../shared/map.h \
    ../shared/mapitemcreatedpacket.h \
    ../shared/mapitemdestroyedpacket.h \
    ../shared/mapitem.h \
    ../shared/mapitemmovepacket.h \
    ../shared/mapitempacket.h \
    ../shared/mapitemremovedpacket.h \
    ../shared/messagepacket.h \
    ../shared/packet.h \
    ../shared/playerdisease.h \
    ../shared/player.h \
    ../shared/playerinfectedpacket.h \
    ../shared/playerinfo.h \
    ../shared/playerkilledpacket.h \
    ../shared/playermodifiedpacket.h \
    ../shared/playerrotation.h \
    ../shared/playerstats.h \
    ../shared/playersynchronizepacket.h \
    ../shared/positionpacket.h \
    ../shared/serverconfiguration.h \
    ../shared/startgamerequestpacket.h \
    ../shared/startgameresponsepacket.h \
    ../shared/stonedroppacket.h \
    ../shared/stonemapitem.h \
    ../shared/stopgamerequestpacket.h \
    ../shared/stopgameresponsepacket.h \
    ../shared/systemtools.h \
    ../shared/timepacket.h \
    src/effects/lensflare/lensflarefactory.h \
    src/effects/lensflare/lensflareghost.h \
    src/effects/lensflare/lensflare.h \
    src/effects/lensflare/lensflarevertex.h \
    src/effects/ribbons/ribbonanimationfactory.h \
    src/effects/ribbons/ribbonanimation.h \
    src/effects/ribbons/ribbonvertex.h \
    src/effects/spherefragments/blendquad.h \
    src/effects/spherefragments/bombfuzegeometryvbo.h \
    src/effects/spherefragments/bombsocketgeometryvbo.h \
    src/effects/spherefragments/duplicatealpha.h \
    src/effects/spherefragments/geometryvbo.h \
    src/effects/spherefragments/spherefragmentcontainer.h \
    src/effects/spherefragments/spherefragment.h \
    src/effects/spherefragments/spherefragmentsdrawable.h \
    src/effects/spherefragments/spheregeometryvbo.h \
    src/effects/spherefragments/vertex3d.h \
    src/effects/startalers/startalersfactory.h \
    src/effects/startalers/startalers.h \
    src/effects/startalers/startalersvertex.h \
    src/engine/animation/bakedtransformation.h \
    src/engine/animation/key.h \
    src/engine/animation/motionmixer.h \
    src/engine/animation/poskey.h \
    src/engine/animation/postrack.h \
    src/engine/animation/rotkey.h \
    src/engine/animation/rottrack.h \
    src/engine/animation/scalekey.h \
    src/engine/animation/scaletrack.h \
    src/engine/animation/track.h \
    src/engine/animation/valkey.h \
    src/engine/animation/valtrack.h \
    src/engine/animation/vistrack.h \
    src/engine/materials/blockmaterial.h \
    src/engine/materials/bombexplosionshader.h \
    src/engine/materials/destructionmaterial.h \
    src/engine/materials/displacementmaterial.h \
    src/engine/materials/environmentambientdiffusematerial.h \
    src/engine/materials/environmentambientmaterial.h \
    src/engine/materials/environmentmaterial.h \
    src/engine/materials/environmenttexturematerial.h \
    src/engine/materials/extramapping.h \
    src/engine/materials/invisibilitymaterial.h \
    src/engine/materials/materialfactory.h \
    src/engine/materials/material.h \
    src/engine/materials/outlining.h \
    src/engine/materials/playermaterialbase.h \
    src/engine/materials/playermaterial.h \
    src/engine/materials/shadowbillboard.h \
    src/engine/materials/skullmaterial.h \
    src/engine/materials/texturematerial.h \
    src/engine/materials/textureslot.h \
    src/engine/nodes/animatedmesh.h \
    src/engine/nodes/camera.h \
    src/engine/nodes/dummy.h \
    src/engine/nodes/light.h \
    src/engine/nodes/mesh.h \
    src/engine/nodes/shape.h \
    src/engine/nodes/node.h \
    src/engine/nodes/omni.h \
    src/engine/nodes/scenegraph.h \
    src/engine/render/bone.h \
    src/engine/render/edge.h \
    src/engine/render/facelist.h \
    src/engine/render/geometry.h \
    src/engine/render/idlist.h \
    src/engine/render/indexlist.h \
    src/engine/render/meshcompress.h \
    src/engine/render/renderbuffer.h \
    src/engine/render/texture.h \
    src/engine/render/texturepool.h \
    src/engine/render/uvchannel.h \
    src/engine/render/uv.h \
    src/engine/render/vcache.h \
    src/engine/render/vertexbuffer.h \
    src/engine/render/vertexbufferpool.h \
    src/engine/render/weight.h \
    src/framework/drawable.h \
    src/framework/framebuffer.h \
    src/framework/frametimer.h \
    src/framework/gldevice.h \
    src/framework/glext.h \
    src/framework/globaltime.h \
    src/framework/maindrawable.h \
    src/framework/renderdevice.h \
    src/framework/timerhandler.h \
    src/game/animatedgamemessage.h \
    src/game/bombermanclientgui.h \
    src/game/bombermanclient.h \
    src/game/bombermanview.h \
    src/game/countdowndrawable.h \
    src/game/deathflowfieldanimation.h \
    src/game/detonation.h \
    src/game/detonationmanager.h \
    src/game/extraanimation.h \
    src/game/extra.h \
    src/game/extrarevealanimation.h \
    src/game/fonttools.h \
    src/game/fuseparticleemitter.h \
    src/game/fuseparticle.h \
    src/game/gamedrawable.h \
    src/game/gamefontmap.h \
    src/game/gamehelpdrawable.h \
    src/game/gamehelptexts.h \
    src/game/gamejoystickintegration.h \
    src/game/gamejoystickmapping.h \
    src/game/gamelogodrawable.h \
    src/game/gamelogopointsprite.h \
    src/game/gamemenuhelp.h \
    src/game/gamemessage.h \
    src/game/gamemessagingdrawable.h \
    src/game/gameplaybackdisplay.h \
    src/game/gameplayback.h \
    src/game/gameplayernamedisplay.h \
    src/game/gamesettings.h \
    src/game/gamestatemachine.h \
    src/game/gamestatsdrawable.h \
    src/game/gameversion.h \
    src/game/gamewindrawable.h \
    src/game/headlessclient.h \
    src/game/headlessintegration.h \
    src/game/helpelement.h \
    src/game/helpmanager.h \
    src/game/hotkeydrawable.h \
    src/game/infectedflowfieldanimation.h \
    src/game/infectionanimation.h \
    src/game/joystickcalibration.h \
    src/game/joystickmapper.h \
    src/game/keyboardmapper.h \
    src/game/loadingdrawable.h \
    src/game/mapitemanimation.h \
    src/game/menujoystickgraphelement.h \
    src/game/menujoystickgraph.h \
    src/game/menujoystickhandler.h \
    src/game/menujoystickmouseanimation.h \
    src/game/mushroomanimation.h \
    src/game/musicplayerdrawable.h \
    src/game/playbackcheckpoint.h \
    src/game/playbackpacketfilter.h \
    src/game/playerboundingrect.h \
    src/game/playerdeatheffect.h \
    src/game/playerinfectedeffect.h \
    src/game/playerinvincibleeffect.h \
    src/game/playerinvincibleinstance.h \
    src/game/playeritem.h \
    src/game/positioninterpolation.h \
    src/game/roundsdrawable.h \
    src/game/skull.h \
    src/game/soundmanager.h \
    src/game/videodebugging.h \
    src/game/videooptions.h \
    src/game/wordwrap.h \
    src/image/bmp.h \
    src/image/image.h \
    src/image/imagepool.h \
    src/image/psd.h \
    src/image/tga.h \
    src/joystick/joystickballvector.h \
    src/joystick/joystickconstants.h \
    src/joystick/joystickhandler.h \
    src/joystick/joystickinfo.h \
    src/joystick/joystickinterface.h \
    src/joystick/joystickinterfacesdl.h \
    src/levels/camerainterpolation.h \
    src/levels/castle/castlematerialfactory.h \
    src/levels/castle/levelcastle.h \
    src/levels/castle/snowanimation.h \
    src/levels/castle/snowparticle.h \
    src/levels/levelfactory.h \
    src/levels/level.h \
    src/levels/levelloadingthread.h \
    src/levels/mansion/levelmansion.h \
    src/levels/space/earthbackground.h \
    src/levels/space/levelspace.h \
    src/levels/space/starfieldbackground.h \
    src/math/matrix.h \
    src/math/quat.h \
    src/math/vector2.h \
    src/math/vector4.h \
    src/math/vector.h \
    src/menus/bitmapfont.h \
    src/menus/clipper.h \
    src/menus/fontmap.h \
    src/menus/fontpool.h \
    src/menus/gamemenudefines.h \
    src/menus/gamemenuinterfacecreate.h \
    src/menus/gamemenuinterfacecredits.h \
    src/menus/gamemenuinterface.h \
    src/menus/gamemenuinterfacelounge.h \
    src/menus/gamemenuinterfacemain.h \
    src/menus/gamemenuinterfaceoptions.h \
    src/menus/gamemenuinterfaceselect.h \
    src/menus/gamemenuworkflow.h \
    src/menus/hosthistory.h \
    src/menus/menudrawable.h \
    src/menus/menu.h \
    src/menus/menuinterface.h \
    src/menus/menumousecursor.h \
    src/menus/menupageanimation.h \
    src/menus/menupagebackgrounditem.h \
    src/menus/menupagebuttonitem.h \
    src/menus/menupagecheckboxitem.h \
    src/menus/menupagecolorselectitem.h \
    src/menus/menupagecomboboxitem.h \
    src/menus/menupageeditablecomboboxitem.h \
    src/menus/menupagefadeanimation.h \
    src/menus/menupage.h \
    src/menus/menupageitem.h \
    src/menus/menupagelabelitem.h \
    src/menus/menupagelistitemelement.h \
    src/menus/menupagelistitem.h \
    src/menus/menupagepixmapitem.h \
    src/menus/menupageradiobuttonitem.h \
    src/menus/menupagescrollbar.h \
    src/menus/menupagescrollimageitem.h \
    src/menus/menupageslideritem.h \
    src/menus/menupagetextedit.h \
    src/menus/menuworkflow.h \
    src/menus/psdlayer.h \
    src/menus/shaderpool.h \
    src/menus/vertex.h \
    src/mp3/audioformat.h \
    src/mp3/dct64.h \
    src/mp3/frameparameter.h \
    src/mp3/id3.h \
    src/mp3/layer1.h \
    src/mp3/layer2.h \
    src/mp3/layer3.h \
    src/mp3/mpegstream.h \
    src/postproduction/blurfilter.h \
    src/postproduction/brightnessfilter.h \
    src/postproduction/filter.h \
    src/postproduction/motionblurfilter.h \
    src/postproduction/shroomfilter.h \
    src/sound/playlist.h \
    src/soundsystem/audiomixer.h \
    src/soundsystem/audiosample.h \
    src/soundsystem/audiosourceinterface.h \
    src/soundsystem/dummysounddevice.h \
    src/soundsystem/mixerchannel.h \
    src/soundsystem/sampleplayer.h \
    src/soundsystem/sounddevice.h \
    src/soundsystem/sounddeviceinterface.h \
    src/soundsystem/soundeffect.h \
    src/soundsystem/streamplayer.h \
    src/soundsystem/streamsample.h \
    src/soundsystem/wave.h \
    src/tools/array.h \
    src/tools/bitstream.h \
    src/tools/conio.h \
    src/tools/filestreamrunnable.h \
    src/tools/fps.h \
    src/tools/list.h \
    src/tools/map2d.h \
    src/tools/pool.h \
    src/tools/profiling.h \
    src/tools/random.h \
    src/tools/rect.h \
    src/tools/referenced.h \
    src/tools/singleton.h \
    src/tools/stream.h \
    src/tools/string.h \
    src/game/charcycling.h \
    src/game/joystickassignmentsdl.h \
    src/game/controllerassignment.h \
    src/game/keyboardassignment.h

SOURCES += \
    ../ai/astarmap.cpp \
    ../ai/astarnode.cpp \
    ../ai/astarpathfinding.cpp \
    ../ai/bombchainreaction.cpp \
    ../ai/botaction.cpp \
    ../ai/botbombaction.cpp \
    ../ai/botbombmapitem.cpp \
    ../ai/botcharacter.cpp \
    ../ai/botclient.cpp \
    ../ai/botconstants.cpp \
    ../ai/bot.cpp \
    ../ai/botfactory.cpp \
    ../ai/botgui.cpp \
    ../ai/botidleaction.cpp \
    ../ai/botmap.cpp \
    ../ai/botoption.cpp \
    ../ai/botplayerinfo.cpp \
    ../ai/botwalkaction.cpp \
    ../ai/path.cpp \
    ../ai/pathfinding.cpp \
    ../ai/protobot.cpp \
    ../ai/protobotinsults.cpp \
    ../ai/protobotmemory.cpp \
    ../server/src/collisiondetection.cpp \
    ../server/src/extrashakepackethandler.cpp \
    ../server/src/extraspawn.cpp \
    ../server/src/game.cpp \
    ../server/src/server.cpp \
    ../shared/blockmapitem.cpp \
    ../shared/bombkickanimation.cpp \
    ../shared/bombmapitem.cpp \
    ../shared/bombpacket.cpp \
    ../shared/constants.cpp \
    ../shared/countdownpacket.cpp \
    ../shared/creategamedata.cpp \
    ../shared/creategamerequestpacket.cpp \
    ../shared/creategameresponsepacket.cpp \
    ../shared/detonationpacket.cpp \
    ../shared/errorpacket.cpp \
    ../shared/extramapitem.cpp \
    ../shared/extramapitemcreatedpacket.cpp \
    ../shared/extrashakepacket.cpp \
    ../shared/gameeventpacket.cpp \
    ../shared/gameinformation.cpp \
    ../shared/gameround.cpp \
    ../shared/gamestatspacket.cpp \
    ../shared/joingamerequestpacket.cpp \
    ../shared/joingameresponsepacket.cpp \
    ../shared/keypacket.cpp \
    ../shared/leavegamerequestpacket.cpp \
    ../shared/leavegameresponsepacket.cpp \
    ../shared/listgamesrequestpacket.cpp \
    ../shared/listgamesresponsepacket.cpp \
    ../shared/loginrequestpacket.cpp \
    ../shared/loginresponsepacket.cpp \
    ../shared/map.cpp \
    ../shared/mapcreaterequestpacket.cpp \
    ../shared/mapitem.cpp \
    ../shared/mapitemcreatedpacket.cpp \
    ../shared/mapitemdestroyedpacket.cpp \
    ../shared/mapitemmovepacket.cpp \
    ../shared/mapitempacket.cpp \
    ../shared/mapitemremovedpacket.cpp \
    ../shared/messagepacket.cpp \
    ../shared/packet.cpp \
    ../shared/player.cpp \
    ../shared/playerdisease.cpp \
    ../shared/playerinfectedpacket.cpp \
    ../shared/playerinfo.cpp \
    ../shared/playerkilledpacket.cpp \
    ../shared/playermodifiedpacket.cpp \
    ../shared/playerrotation.cpp \
    ../shared/playerstats.cpp \
    ../shared/playersynchronizepacket.cpp \
    ../shared/positionpacket.cpp \
    ../shared/serverconfiguration.cpp \
    ../shared/startgamerequestpacket.cpp \
    ../shared/startgameresponsepacket.cpp \
    ../shared/stonedroppacket.cpp \
    ../shared/stonemapitem.cpp \
    ../shared/stopgamerequestpacket.cpp \
    ../shared/stopgameresponsepacket.cpp \
    ../shared/systemtools.cpp \
    ../shared/timepacket.cpp \
    src/dynamain.cpp \
    src/effects/lensflare/lensflare.cpp \
    src/effects/lensflare/lensflarefactory.cpp \
    src/effects/lensflare/lensflareghost.cpp \
    src/effects/ribbons/ribbonanimation.cpp \
    src/effects/ribbons/ribbonanimationfactory.cpp \
    src/effects/spherefragments/blendquad.cpp \
    src/effects/spherefragments/bombfuzegeometryvbo.cpp \
    src/effects/spherefragments/bombsocketgeometryvbo.cpp \
    src/effects/spherefragments/duplicatealpha.cpp \
    src/effects/spherefragments/geometryvbo.cpp \
    src/effects/spherefragments/spherefragmentcontainer.cpp \
    src/effects/spherefragments/spherefragment.cpp \
    src/effects/spherefragments/spherefragmentsdrawable.cpp \
    src/effects/spherefragments/spheregeometryvbo.cpp \
    src/effects/spherefragments/vertex3d.cpp \
    src/effects/startalers/startalers.cpp \
    src/effects/startalers/startalersfactory.cpp \
    src/engine/animation/bakedtransformation.cpp \
    src/engine/animation/keybase.cpp \
    src/engine/animation/key.cpp \
    src/engine/animation/morphkey.cpp \
    src/engine/animation/morphtrack.cpp \
    src/engine/animation/motionmixer.cpp \
    src/engine/animation/poskey.cpp \
    src/engine/animation/postrack.cpp \
    src/engine/animation/rotkey.cpp \
    src/engine/animation/rottrack.cpp \
    src/engine/animation/scalekey.cpp \
    src/engine/animation/scaletrack.cpp \
    src/engine/animation/valkey.cpp \
    src/engine/animation/valtrack.cpp \
    src/engine/animation/vistrack.cpp \
    src/engine/materials/blockmaterial.cpp \
    src/engine/materials/bombexplosionshader.cpp \
    src/engine/materials/destructionmaterial.cpp \
    src/engine/materials/displacementmaterial.cpp \
    src/engine/materials/environmentambientdiffusematerial.cpp \
    src/engine/materials/environmentambientmaterial.cpp \
    src/engine/materials/environmentmaterial.cpp \
    src/engine/materials/environmenttexturematerial.cpp \
    src/engine/materials/extramapping.cpp \
    src/engine/materials/invisibilitymaterial.cpp \
    src/engine/materials/material.cpp \
    src/engine/materials/materialfactory.cpp \
    src/engine/materials/outlining.cpp \
    src/engine/materials/playermaterialbase.cpp \
    src/engine/materials/playermaterial.cpp \
    src/engine/materials/shadowbillboard.cpp \
    src/engine/materials/skullmaterial.cpp \
    src/engine/materials/texturematerial.cpp \
    src/engine/materials/textureslot.cpp \
    src/engine/nodes/animatedmesh.cpp \
    src/engine/nodes/camera.cpp \
    src/engine/nodes/dummy.cpp \
    src/engine/nodes/light.cpp \
    src/engine/nodes/mesh.cpp \
    src/engine/nodes/shape.cpp \
    src/engine/nodes/node.cpp \
    src/engine/nodes/omni.cpp \
    src/engine/nodes/scenegraph.cpp \
    src/engine/render/bone.cpp \
    src/engine/render/edge.cpp \
    src/engine/render/facelist.cpp \
    src/engine/render/geometry.cpp \
    src/engine/render/idlist.cpp \
    src/engine/render/renderbuffer.cpp \
    src/engine/render/texture.cpp \
    src/engine/render/texturepool.cpp \
    src/engine/render/uvchannel.cpp \
    src/engine/render/uv.cpp \
    src/engine/render/vertexbuffer.cpp \
    src/engine/render/vertexbufferpool.cpp \
    src/engine/render/weight.cpp \
    src/framework/drawable.cpp \
    src/framework/framebuffer.cpp \
    src/framework/frametimer.cpp \
    src/framework/gldevice.cpp \
    src/framework/globaltime.cpp \
    src/framework/maindrawable.cpp \
    src/framework/renderdevice.cpp \
    src/framework/timerhandler.cpp \
    src/game/animatedgamemessage.cpp \
    src/game/bombermanclient.cpp \
    src/game/bombermanclientgui.cpp \
    src/game/bombermanview.cpp \
    src/game/countdowndrawable.cpp \
    src/game/deathflowfieldanimation.cpp \
    src/game/detonation.cpp \
    src/game/detonationmanager.cpp \
    src/game/extraanimation.cpp \
    src/game/extra.cpp \
    src/game/extrarevealanimation.cpp \
    src/game/fonttools.cpp \
    src/game/fuseparticle.cpp \
    src/game/fuseparticleemitter.cpp \
    src/game/gamedrawable.cpp \
    src/game/gamefontmap.cpp \
    src/game/gamehelpdrawable.cpp \
    src/game/gamejoystickintegration.cpp \
    src/game/gamejoystickmapping.cpp \
    src/game/gamelogodrawable.cpp \
    src/game/gamelogopointsprite.cpp \
    src/game/gamemenuhelp.cpp \
    src/game/gamemessage.cpp \
    src/game/gamemessagingdrawable.cpp \
    src/game/gameplayback.cpp \
    src/game/gameplaybackdisplay.cpp \
    src/game/gameplayernamedisplay.cpp \
    src/game/gamesettings.cpp \
    src/game/gamestatemachine.cpp \
    src/game/gamestatsdrawable.cpp \
    src/game/gamewindrawable.cpp \
    src/game/headlessclient.cpp \
    src/game/headlessintegration.cpp \
    src/game/helpelement.cpp \
    src/game/helpmanager.cpp \
    src/game/hotkeydrawable.cpp \
    src/game/infectedflowfieldanimation.cpp \
    src/game/infectionanimation.cpp \
    src/game/invisibleplayereffect.cpp \
    src/game/joystickcalibration.cpp \
    src/game/joystickmapper.cpp \
    src/game/keyboardmapper.cpp \
    src/game/loadingdrawable.cpp \
    src/game/mapitemanimation.cpp \
    src/game/menujoystickgraph.cpp \
    src/game/menujoystickgraphelement.cpp \
    src/game/menujoystickhandler.cpp \
    src/game/menujoystickmouseanimation.cpp \
    src/game/mushroomanimation.cpp \
    src/game/musicplayerdrawable.cpp \
    src/game/playbackcheckpoint.cpp \
    src/game/playbackpacketfilter.cpp \
    src/game/playerboundingrect.cpp \
    src/game/playerdeatheffect.cpp \
    src/game/playerinfectedeffect.cpp \
    src/game/playerinvincibleeffect.cpp \
    src/game/playerinvincibleinstance.cpp \
    src/game/playeritem.cpp \
    src/game/positioninterpolation.cpp \
    src/game/roundsdrawable.cpp \
    src/game/skull.cpp \
    src/game/soundmanager.cpp \
    src/game/videodebugging.cpp \
    src/game/videooptions.cpp \
    src/game/videooptionssdl.cpp \
    src/game/wordwrap.cpp \
    src/image/bmp.cpp \
    src/image/image.cpp \
    src/image/imagepool.cpp \
    src/image/psd.cpp \
    src/image/tga.cpp \
    src/joystick/joystickhandler.cpp \
    src/joystick/joystickinfo.cpp \
    src/joystick/joystickinterface.cpp \
    src/joystick/joystickinterfacesdl.cpp \
    src/levels/camerainterpolation.cpp \
    src/levels/castle/castlematerialfactory.cpp \
    src/levels/castle/levelcastle.cpp \
    src/levels/castle/snowanimation.cpp \
    src/levels/castle/snowparticle.cpp \
    src/levels/level.cpp \
    src/levels/levelfactory.cpp \
    src/levels/levelloadingthread.cpp \
    src/levels/mansion/levelmansion.cpp \
    src/levels/space/earthbackground.cpp \
    src/levels/space/levelspace.cpp \
    src/levels/space/starfieldbackground.cpp \
    src/math/matrix.cpp \
    src/math/quat.cpp \
    src/math/scale.cpp \
    src/math/vector2.cpp \
    src/math/vector4.cpp \
    src/math/vector.cpp \
    src/menus/bitmapfont.cpp \
    src/menus/clipper.cpp \
    src/menus/fontmap.cpp \
    src/menus/gamemenuinterface.cpp \
    src/menus/gamemenuinterfacecreate.cpp \
    src/menus/gamemenuinterfacecredits.cpp \
    src/menus/gamemenuinterfacelounge.cpp \
    src/menus/gamemenuinterfacemain.cpp \
    src/menus/gamemenuinterfaceoptions.cpp \
    src/menus/gamemenuinterfaceselect.cpp \
    src/menus/gamemenuworkflow.cpp \
    src/menus/hosthistory.cpp \
    src/menus/menu.cpp \
    src/menus/menudrawable.cpp \
    src/menus/menuinterface.cpp \
    src/menus/menumousecursor.cpp \
    src/menus/menupageanimation.cpp \
    src/menus/menupagebackgrounditem.cpp \
    src/menus/menupagebuttonitem.cpp \
    src/menus/menupagecheckboxitem.cpp \
    src/menus/menupagecolorselectitem.cpp \
    src/menus/menupagecomboboxitem.cpp \
    src/menus/menupage.cpp \
    src/menus/menupageeditablecomboboxitem.cpp \
    src/menus/menupagefadeanimation.cpp \
    src/menus/menupageitem.cpp \
    src/menus/menupagelabelitem.cpp \
    src/menus/menupagelistitem.cpp \
    src/menus/menupagelistitemelement.cpp \
    src/menus/menupagepixmapitem.cpp \
    src/menus/menupageradiobuttonitem.cpp \
    src/menus/menupagescrollbar.cpp \
    src/menus/menupagescrollimageitem.cpp \
    src/menus/menupageslideritem.cpp \
    src/menus/menupagetextedit.cpp \
    src/menus/menuworkflow.cpp \
    src/menus/psdlayer.cpp \
    src/menus/shaderpool.cpp \
    src/menus/vertex.cpp \
    src/mp3/audioformat.cpp \
    src/mp3/dct64.cpp \
    src/mp3/frameparameter.cpp \
    src/mp3/id3.cpp \
    src/mp3/layer1.cpp \
    src/mp3/layer2.cpp \
    src/mp3/layer3.cpp \
    src/mp3/mpegstream.cpp \
    src/mp3/synth.cpp \
    src/mp3/tabinit.cpp \
    src/postproduction/blurfilter.cpp \
    src/postproduction/brightnessfilter.cpp \
    src/postproduction/filter.cpp \
    src/postproduction/motionblurfilter.cpp \
    src/postproduction/shroomfilter.cpp \
    src/sound/playlist.cpp \
    src/soundsystem/audiomixer.cpp \
    src/soundsystem/audiosample.cpp \
    src/soundsystem/audiosourceinterface.cpp \
    src/soundsystem/dummysounddevice.cpp \
    src/soundsystem/mixerchannel.cpp \
    src/soundsystem/sampleplayer.cpp \
    src/soundsystem/sounddevice.cpp \
    src/soundsystem/sounddeviceinterface.cpp \
    src/soundsystem/soundeffect.cpp \
    src/soundsystem/streamplayer.cpp \
    src/soundsystem/streamsample.cpp \
    src/soundsystem/wave.cpp \
    src/tools/bitstream.cpp \
    src/tools/chunk.cpp \
    src/tools/filestream.cpp \
    src/tools/filestreamrunnable.cpp \
    src/tools/fps.cpp \
    src/tools/objectname.cpp \
    src/tools/profiling.cpp \
    src/tools/rect.cpp \
    src/tools/referenced.cpp \
    src/tools/stream.cpp \
    src/tools/string.cpp \
    src/game/charcycling.cpp \
    src/game/joystickassignmentsdl.cpp \
    src/game/controllerassignment.cpp \
    src/game/keyboardassignment.cpp

OTHER_FILES += \
    data/game.ini \
    data/effects/lensflare/shaders/lensflare-frag.glsl \
    data/effects/lensflare/shaders/lensflare-vert.glsl \
    data/effects/ribbons/shaders/ribbon-frag.glsl \
    data/effects/ribbons/shaders/ribbon-vert.glsl \
    data/effects/spherefragments/shaders/blendquad-frag.glsl \
    data/effects/spherefragments/shaders/blendquad-vert.glsl \
    data/effects/spherefragments/shaders/duplicatealpha-frag.glsl \
    data/effects/spherefragments/shaders/duplicatealpha-vert.glsl \
    data/effects/spherefragments/shaders/simplelight-frag.glsl \
    data/effects/spherefragments/shaders/simplelight-vert.glsl \
    data/effects/spherefragments/shaders/socketlight-frag.glsl \
    data/effects/spherefragments/shaders/socketlight-vert.glsl \
    data/effects/spherefragments/shaders/spherefragments-frag.glsl \
    data/effects/spherefragments/shaders/spherefragments-vert.glsl \
    data/effects/startalers/shaders/startalers-frag.glsl \
    data/effects/startalers/shaders/startalers-vert.glsl \
    data/menus/menu.ini \
    data/shaders/alphafade-frag.glsl \
    data/shaders/alphafade-vert.glsl \
    data/shaders/blockmaterial-frag.glsl \
    data/shaders/blockmaterial-vert.glsl \
    data/shaders/blur-frag.glsl \
    data/shaders/blur-vert.glsl \
    data/shaders/blurprepass-frag.glsl \
    data/shaders/blurprepass-quarter-frag.glsl \
    data/shaders/blurprepass-simple-frag.glsl \
    data/shaders/brightness-frag.glsl \
    data/shaders/brightness-vert.glsl \
    data/shaders/deathflowfield-frag.glsl \
    data/shaders/deathflowfield-vert.glsl \
    data/shaders/deathparticles-frag.glsl \
    data/shaders/deathparticles-vert.glsl \
    data/shaders/deathinitpositions-vert.glsl \
    data/shaders/deathinitpositions-frag.glsl \
    data/shaders/deathinitparams-vert.glsl \
    data/shaders/deathinitparams-frag.glsl \
    data/shaders/infectedflowfield-frag.glsl \
    data/shaders/infectedflowfield-vert.glsl \
    data/shaders/infectedparticles-frag.glsl \
    data/shaders/infectedparticles-vert.glsl \
    data/shaders/infectedinitpositions-vert.glsl \
    data/shaders/infectedinitpositions-frag.glsl \
    data/shaders/infectedinitparams-vert.glsl \
    data/shaders/infectedinitparams-frag.glsl \
    data/shaders/infectedupdatecolors-vert.glsl \
    data/shaders/infectedupdatecolors-frag.glsl \
    data/shaders/destruction-frag.glsl \
    data/shaders/destruction-vert.glsl \
    data/shaders/displacementmaterial-frag.glsl \
    data/shaders/displacementmaterial-vert.glsl \
    data/shaders/environment-frag.glsl \
    data/shaders/environment-vert.glsl \
    data/shaders/environmentambient-frag.glsl \
    data/shaders/environmentambient-vert.glsl \
    data/shaders/environmenttexture-frag.glsl \
    data/shaders/environmenttexture-vert.glsl \
    data/shaders/extrareveal-frag.glsl \
    data/shaders/extrareveal-vert.glsl \
    data/shaders/flame-frag.glsl \
    data/shaders/flame-vert.glsl \
    data/shaders/fontoutlines-frag.glsl \
    data/shaders/fontoutlines-vert.glsl \
    data/shaders/grayscale-frag.glsl \
    data/shaders/grayscale-vert.glsl \
    data/shaders/listhighlight-frag.glsl \
    data/shaders/listhighlight-vert.glsl \
    data/shaders/motionblur-frag.glsl \
    data/shaders/motionblur-vert.glsl \
    data/shaders/mushroom-frag.glsl \
    data/shaders/mushroom-vert.glsl \
    data/shaders/outlining-frag.glsl \
    data/shaders/outlining-vert.glsl \
    data/shaders/playermaterial-frag.glsl \
    data/shaders/playermaterial-vert.glsl \
    data/shaders/progressbar-frag.glsl \
    data/shaders/progressbar-vert.glsl \
    data/shaders/shadowbillboard-frag.glsl \
    data/shaders/shadowbillboard-vert.glsl \
    data/shaders/simplelight-frag.glsl \
    data/shaders/simplelight-vert.glsl \
    data/shaders/skullmaterial-frag.glsl \
    data/shaders/skullmaterial-vert.glsl \
    data/shaders/snow-frag.glsl \
    data/shaders/snow-vert.glsl \
    data/shaders/earth-frag.glsl \
    data/shaders/earth-vert.glsl \
    data/shaders/texalphaignore-frag.glsl \
    data/shaders/texalphaignore-vert.glsl \
    data/shaders/texturemapping-frag.glsl \
    data/shaders/texturemapping-vert.glsl \
    data/shaders/playerinvincibleblurh-frag.glsl \
    data/shaders/playerinvincibleblurh-vert.glsl \
    data/shaders/playerinvincibledisplace-frag.glsl \
    data/shaders/playerinvincibledisplace-vert.glsl \
    data/shaders/playerinvincibleblurv-frag.glsl \
    data/shaders/playerinvincibleblurv-vert.glsl
