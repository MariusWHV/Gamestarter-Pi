#!/bin/bash
# Script for installing Gamestarter

#Welcome message
echo 'Gamestarter Pi' 
ADDON_DIRECTORY=$1

# comprobamos si le ha llegado una ruta sino ponemos la de OLE por defecto
if [ -z "$ADDON_DIRECTORY" ]; then
	ADDON_DIRECTORY="/storage/.kodi/addons/script.gamestarter"
	# ADDON_DIRECTORY="/home/osmc/.kodi/addons/script.gamestarter"
# else
	# echo "$ADDON_DIRECTORY"
fi


echo "::Gamestarter:: -> installing in Open/LibreELEC..."
CONFIG_DIRECTORY="/storage/.config"
ROOT_DIRECTORY="/storage"
 
# añadir audio al config.txt
echo '::Gamestarter:: -> edit config.txt...'
mount -o remount,rw /flash
echo 'dtparam=audio=on' >> /flash/config.txt



# hacer ejecutables los scripts y binarios
echo '::Gamestarter:: -> script permissions...'
chmod a+x $ADDON_DIRECTORY/resources/bin/gamestarter.sh
chmod a+x $ADDON_DIRECTORY/resources/bin/gamestarter.start
chmod a+x $ADDON_DIRECTORY/resources/bin/retroarch
# chmod a+x $ADDON_DIRECTORY/resources/bin/emulationstation
chmod a+x $ADDON_DIRECTORY/resources/bin/uae4arm

# chmod a+x $ADDON_DIRECTORY/resources/bin/install_iarl.sh
# chmod a+x $ADDON_DIRECTORY/resources/bin/install_gamemaker.sh

#comprobamos si hay archivos de configs anteriores para no borrarlos en las actualizaciones
# mv $CONFIG_DIRECTORY/retroarch/retroarch.cfg $CONFIG_DIRECTORY/retroarch/retroarch_BACKUP.cfg
# mv $CONFIG_DIRECTORY/advancedlauncher/launchers.xml $CONFIG_DIRECTORY/advancedlauncher/launchers_BACKUP.xml
# mv $CONFIG_DIRECTORY/emulationstation/es_systems.cfg $CONFIG_DIRECTORY/emulationstation/es_systems_BACKUP.cfg

if [ -f "$CONFIG_DIRECTORY/retroarch/retroarch.cfg" ]
then
	mv $CONFIG_DIRECTORY/retroarch/retroarch.cfg $CONFIG_DIRECTORY/retroarch/retroarch_BACKUP.cfg
	mv $CONFIG_DIRECTORY/retroarch/config/retroarch-core-options.cfg $CONFIG_DIRECTORY/retroarch/config/retroarch-core-options_BACKUP.cfg
fi

if [ -f "$CONFIG_DIRECTORY/advancedlauncher/launchers.xml" ]
then
	mv $CONFIG_DIRECTORY/advancedlauncher/launchers.xml $CONFIG_DIRECTORY/advancedlauncher/launchers_BACKUP.xml
fi

#if [ -f "$CONFIG_DIRECTORY/emulationstation/es_systems.cfg" ]
#then
#	mv $CONFIG_DIRECTORY/emulationstation/es_systems.cfg $CONFIG_DIRECTORY/emulationstation/es_systems_BACKUP.cfg
#	mv $CONFIG_DIRECTORY/emulationstation/es_input.cfg $CONFIG_DIRECTORY/emulationstation/es_input_BACKUP.cfg
#fi

#copiar los packages de data a .config
echo '::Gamestarter:: -> copying packages...'
tar -xf $ADDON_DIRECTORY/resources/data/retroarch.tar.gz -C $CONFIG_DIRECTORY/ -xz
tar -xf $ADDON_DIRECTORY/resources/data/libretro-part1.tar.gz -C $CONFIG_DIRECTORY/retroarch/cores/ -xz
tar -xf $ADDON_DIRECTORY/resources/data/libretro-part2.tar.gz -C $CONFIG_DIRECTORY/retroarch/cores/ -xz
# tar -xf $ADDON_DIRECTORY/resources/data/libretro-part3.tar.gz -C $CONFIG_DIRECTORY/retroarch/cores/ -xz
# tar -xf $ADDON_DIRECTORY/resources/data/emulationstation.tar.gz -C $CONFIG_DIRECTORY/ -xz
tar -xf $ADDON_DIRECTORY/resources/data/emulators.tar.gz -C $ROOT_DIRECTORY -xz
tar -xf $ADDON_DIRECTORY/resources/data/advancedlauncher.tar.gz -C $CONFIG_DIRECTORY/ -xz

chmod a+x $ROOT_DIRECTORY/emulators/roms/ports/CaveStory.sh
chmod a+x $ROOT_DIRECTORY/emulators/roms/ports/Dinothawr.sh
chmod a+x $ROOT_DIRECTORY/emulators/roms/ports/Doom.sh
chmod a+x $ROOT_DIRECTORY/emulators/roms/ports/Quake.sh


# instalar advanced launcher a manopla, hay que cambiar por advanced emulator launcher para kodi 17
echo '::Gamestarter:: -> installing advanced launcher...'
ln -s $CONFIG_DIRECTORY/advancedlauncher/ $ROOT_DIRECTORY/.kodi/userdata/addon_data/plugin.program.advanced.launcher
wget --no-check-certificate -O $ROOT_DIRECTORY/advanced.launcher.tar.gz https://github.com/bite-your-idols/Gamestarter-Pi/raw/master/assets/advanced-launcher-2.5.8.tar.gz
tar -xf $ROOT_DIRECTORY/advanced.launcher.tar.gz -C $ROOT_DIRECTORY/.kodi/addons/ -xz
rm $ROOT_DIRECTORY/advanced.launcher.tar.gz

#antes de terminar comprobamos de nuevo si habia archivos y los restauramos guardando los nuevos
if [ -f "$CONFIG_DIRECTORY/retroarch/retroarch_BACKUP.cfg" ]
then
	mv $CONFIG_DIRECTORY/retroarch/retroarch.cfg $CONFIG_DIRECTORY/retroarch/retroarch_gamestarter.cfg
	mv $CONFIG_DIRECTORY/retroarch/retroarch_BACKUP.cfg $CONFIG_DIRECTORY/retroarch/retroarch.cfg
	mv $CONFIG_DIRECTORY/retroarch/config/retroarch-core-options.cfg $CONFIG_DIRECTORY/retroarch/config/retroarch-core-options_gamestarter.cfg
	mv $CONFIG_DIRECTORY/retroarch/config/retroarch-core-options_BACKUP.cfg $CONFIG_DIRECTORY/retroarch/config/retroarch-core-options.cfg
fi

if [ -f "$CONFIG_DIRECTORY/advancedlauncher/launchers_BACKUP.xml" ]
then
	mv $CONFIG_DIRECTORY/advancedlauncher/launchers.xml $CONFIG_DIRECTORY/advancedlauncher/launchers_gamestarter.xml
	mv $CONFIG_DIRECTORY/advancedlauncher/launchers_BACKUP.xml $CONFIG_DIRECTORY/advancedlauncher/launchers.xml
fi

#if [ -f "$CONFIG_DIRECTORY/emulationstation/es_systems_BACKUP.cfg" ]
#then
#	mv $CONFIG_DIRECTORY/emulationstation/es_systems.cfg $CONFIG_DIRECTORY/emulationstation/es_systems_gamestarter.cfg
#	mv $CONFIG_DIRECTORY/emulationstation/es_systems_BACKUP.cfg $CONFIG_DIRECTORY/emulationstation/es_systems.cfg
#	mv $CONFIG_DIRECTORY/emulationstation/es_input.cfg $CONFIG_DIRECTORY/emulationstation/es_input_gamestarter.cfg
#	mv $CONFIG_DIRECTORY/emulationstation/es_input_BACKUP.cfg $CONFIG_DIRECTORY/emulationstation/es_input.cfg
#fi

# borramos los zips de data y creamos el chivato de instalacion
# rm $ADDON_DIRECTORY/resources/data/retroarch.tar.gz
# rm $ADDON_DIRECTORY/resources/data/libretro-part1.tar.gz
# rm $ADDON_DIRECTORY/resources/data/libretro-part2.tar.gz
# rm $ADDON_DIRECTORY/resources/data/libretro-part3.tar.gz
# rm $ADDON_DIRECTORY/resources/data/emulationstation.tar.gz
# rm $ADDON_DIRECTORY/resources/data/emulators.tar.gz
# rm $ADDON_DIRECTORY/resources/data/advancedlauncher.tar.gz

touch $ADDON_DIRECTORY/resources/bin/installed
echo $ADDON_DIRECTORY >> $ADDON_DIRECTORY/resources/bin/installed

# end installation
echo '::Gamestarter:: -> installation completed, enjoy!!'
