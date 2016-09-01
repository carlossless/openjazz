# OpenJazz makefile

SDIR = src
ODIR = obj
BDIR = bin

SDL_CFLAGS = $(shell sdl-config --cflags)
SDL_LDFLAGS = $(shell sdl-config --libs)

_OBJS = \
	game/clientgame.o game/game.o game/gamemode.o \
	game/localgame.o game/servergame.o \
	io/gfx/anim.o io/gfx/font.o io/gfx/paletteeffects.o \
	io/gfx/sprite.o io/gfx/video.o \
	io/gfx/scale2x/getopt.o io/gfx/scale2x/pixel.o \
	io/gfx/scale2x/scale2x.o io/gfx/scale2x/scale3x.o \
	io/gfx/scale2x/scalebit.o io/gfx/scale2x/simple2x.o \
	io/controls.o io/file.o io/network.o io/sound.o \
	jj1bonuslevel/jj1bonuslevelplayer/jj1bonuslevelplayer.o \
	jj1bonuslevel/jj1bonuslevel.o \
	jj1level/jj1event/jj1bridge.o jj1level/jj1event/jj1event.o \
	jj1level/jj1event/jj1guardians.o \
	jj1level/jj1event/jj1standardevent.o \
	jj1level/jj1levelplayer/jj1bird.o \
	jj1level/jj1levelplayer/jj1levelplayer.o \
	jj1level/jj1levelplayer/jj1levelplayerframe.o \
	jj1level/jj1bullet.o jj1level/jj1demolevel.o \
	jj1level/jj1level.o jj1level/jj1levelframe.o \
	jj1level/jj1levelload.o \
	jj1planet/jj1planet.o \
	jj1scene/jj1scene.o jj1scene/jj1sceneload.o \
	jj2level/jj2event/jj2event.o jj2level/jj2event/jj2eventframe.o \
	jj2level/jj2levelplayer/jj2levelplayer.o \
	jj2level/jj2levelplayer/jj2levelplayerframe.o \
	jj2level/jj2layer.o jj2level/jj2level.o \
	jj2level/jj2levelframe.o jj2level/jj2levelload.o \
	level/level.o level/movable.o level/levelplayer.o \
	menu/gamemenu.o menu/mainmenu.o menu/menu.o \
	menu/plasma.o menu/setupmenu.o \
	player/player.o \
	main.o setup.o util.o

OBJS = $(patsubst %,$(ODIR)/%,$(_OBJS))

$(BDIR)/OpenJazz: $(OBJS)
	@mkdir -p $(@D)
	cc -Wall -o $@ $(SDL_LDFLAGS) -lstdc++ -lz $(OBJS)

$(ODIR)/%.o: $(SDIR)/%.cpp
	@mkdir -p $(@D)
	cc -Wall -DUSE_SOCKETS -DSCALE -Isrc -I/usr/local/include/ -O2 -c $< -o $@

.PHONY: clean

clean:
	rm -rf obj bin/OpenJazz
