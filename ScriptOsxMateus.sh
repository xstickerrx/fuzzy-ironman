#!/bin/bash
# configuração do ambiente no Mac - OS X Mavericks
# Defaults selecionados por Augusto Campos
# Referência: https://github.com/eduardolundgren/dotfiles/blob/master/templates/.osx


 	echo "- Desativa substituições automáticas: smart quotes/dashes"
    defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
    defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
    
    echo "- Clique com simples toque no Trackpad"
	defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
    defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
    defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

    echo "- Clique secundário (direito) com 2 dedos ou no canto inferior direito"
	defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2
	defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
	defaults -currentHost write NSGlobalDomain com.apple.trackpad.trackpadCornerClickBehavior -int 1
	defaults -currentHost write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true
    
    echo "- Navegar com Tab em todos os botões e campos nos diálogos modais"
	defaults write NSGlobalDomain AppleKeyboardUIMode -int 3
	
	echo "- Mostrar todas as extensões de arquivos no Finder"
	defaults write NSGlobalDomain AppleShowAllExtensions -bool true
	
	echo "- Mostrar a barra de path no Finder"
	defaults write com.apple.finder ShowPathbar -bool true

	echo "- Mostrar a barra de status no Finder"
	defaults write com.apple.finder ShowStatusBar -bool true
 
	echo "- Finder mostra path completo na barra de título"
	defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
  
	echo "- Expandir por default os diálogos de Salvar e de Imprimir"
	defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
	defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true

	echo "- Desativar a acentuação estilo iOS (press and hold)"
	defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

	echo "- Acelerar repetição do teclado e reduzir delay inicial"
	defaults write NSGlobalDomain KeyRepeat -int 0.02
	defaults write NSGlobalDomain InitialKeyRepeat -int 12

	echo "- Desativar a traiçoeira correção automática"
	defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

	echo "- Mostrar informações sobre os itens junto a seus ícones"
    /usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist
    /usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist
    /usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist
    /usr/libexec/PlistBuddy -c "Set DesktopViewSettings:IconViewSettings:labelOnBottom true" ~/Library/Preferences/com.apple.finder.plist
    
	echo "- Ativar menus de debug, desenvolvedor e inspector do Safari"
	defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
	defaults write com.apple.Safari IncludeDevelopMenu -bool true
	defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
	defaults write com.apple.Safari "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" -bool true
 
	echo "- Default é salvar para o disco, não para o iCloud"
	defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

	echo "- Permitir seleção de texto no Quick Look"
    defaults write com.apple.finder QLEnableTextSelection -bool true
    
    
	echo "- Definir Hot Corners"
    # 	Referência de valores:
    #  	0: no-op
    #  	2: Mission Control
    #  	3: Show application windows
    #  	4: Desktop
    #  	5: Start screen saver
    #  	6: Disable screen saver
    #  	7: Dashboard
    # 	10: Put display to sleep
    # 	11: Launchpad
    # 	12: Notification Center
    # Top left screen corner → Mission Control
    defaults write com.apple.dock wvous-tl-corner -int 2
    defaults write com.apple.dock wvous-tl-modifier -int 0
    # Top right screen corner → Sleep Display
    defaults write com.apple.dock wvous-tr-corner -int 10
    defaults write com.apple.dock wvous-tr-modifier -int 0
    # Bottom left screen corner → Show Desktop
    defaults write com.apple.dock wvous-bl-corner -int 4
    defaults write com.apple.dock wvous-bl-modifier -int 0
    # Bottom right screen corner → Show app windows
    defaults write com.apple.dock wvous-br-corner -int 3
    defaults write com.apple.dock wvous-br-modifier -int 0    
    
    echo "- Usar só UTF-8 no Terminal"
    defaults write com.apple.terminal StringEncodings -array 4
    
    echo "- Reiniciar Dock, Finder e SystemUIServer"
    for app in "Dock" "Finder" "SystemUIServer"; do
        killall "${app}" > /dev/null 2>&1
    done
    
    echo -e "\n- Referência para definir a escalação dos ícones na Dock:"
    echo "	Finder, Prefs, Mac App Store, Launchpad, iTunes"
    echo "	Word, BBEdit, Acorn, Terminal"
    echo "	Safari, Mailplane, Tweetdeck, Adium, Skype"
    
    echo -e "\nReferência para criar separadores na dock: \nhttp://br-mac.org/2011/02/barra-de-tarefas-organizando-a-dock-com-separadores-de-icones.html"
    
    echo -e "\nAtenção: Reinicie o Safari e o Terminal quando for conveniente."   

