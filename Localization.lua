local addonName, Hearthbag = ...

local L = {};
Hearthbag.L = L;

local function defaultFunc(L, key)
 -- If this function was called, we have no localization for this key.
 -- We could complain loudly to allow localizers to see the error of their ways, 
 -- but, for now, just return the key as its own localization. This allows you to—avoid writing the default localization out explicitly.
 return key;
end
setmetatable(L, {__index=defaultFunc});

local LOCALE = GetLocale()


if LOCALE == "enUS" then
	-- The EU English game client also
	-- uses the US English locale code.
	L["TOC_Title"] = "Hearthbag"
	L["TOC_Notes"] = "Adds a customizable hearthstone button"
	L["SLASH_HB1"] = "/hearthbag" -- english slash command - *Do Not Localize*
	L["SLASH_HB2"] = "/hb" -- english slash command - *Do Not Localize*
	L["SLASH_HB3"] = "/hearthbag" -- localized slash command
	L["SLASH_HB4"] = "/hb" -- localized slash command

	L["HearthbagError"] = "Hearthbag Error: %s"
	L["Hearthbag"] = "Hearthbag: %s"
	L["CantFindParent"] = "Could not find parent frame '%s'. Resetting to UIParent."
	L["ShowCFInCombat"] = "Show Combat Frame During Combat"
	L["UnlockCombatFrame"] = "Unlock Combat Anchor Frame"
	L["Unlock"] = UNLOCK
	L["Locked"] = LOCKED
	L["CantAnchorInCombat"] = "Cannot toggle anchor in combat."
	L["TempTele"] = "Temporary Teleport"
	L["RightClick"] = "Right-Click:"
	L["ShiftScroll"] = "Shift-Scroll:"
	L["ShiftDrag"] = "Shift-Drag:"
	L["OpenSettings"] = "Open Settings"
	L["Resize"] = "Resize"
	L["DragFrame"] = "Drag Frame"
	L["RandomHearthstone"] = "Random Hearthstone"
	L["RandomHearthstoneTT"] = "Randomly selects from owned hearthstones"
	L["CantMoveInCombat"] = "Cannot move in combat."
	L["FrameNotFound"] = "Frame '%s' not found."
	L["ResetToUIParent"] = "Reset anchor to UIParent."
	L["NotAFrame"] = "Cannot anchor to '%s'. It is not a Frame."
	L["RestrictedFrame"] = "Cannot anchor to restricted frame '%s'."
	L["CantAnchorToSelf"] = "Cannot anchor to self."
	L["AnchoredToFrame"] = "Anchored to %s"
	L["FrameNoName"] = "Invalid frame. Frame has no name."
	L["ResetHearthstone"] = "Reset hearthstone to centered position."
	L["HBCommands"] = "Hearthbag Commands:"
	L["HB_Slash_Combat1"] = "combat" -- english
	L["HB_Slash_Combat2"] = "combat" -- localized
	L["HB_Slash_Anchor1"] = "anchor" -- english
	L["HB_Slash_Anchor2"] = "anchor" -- localized
	L["HB_Slash_Reset1"] = "reset" -- english
	L["HB_Slash_Reset2"] = "reset" -- localized
	L["HBCMD_combat"] = "/hearthbag combat - Toggle the moveable combat frame."
	L["HBCMD_anchor"] = "/hearthbag anchor [framename] - Set the Hearthbag Parent to the frame under your mouse or to the specified frame name."
	L["HBCMD_reset"] = "/hearthbag reset - Reset to your Hearthbag to centered position."

return end

if LOCALE == "esMX" then
	-- Spanish (Mexico) translations go here
	L["TOC_Title"] = "Hearthbag"
	L["TOC_Notes"] = "Añade un botón de piedra de hogar personalizable"
	L["SLASH_HB1"] = "/hearthbag" -- english slash command - *Do Not Localize*
	L["SLASH_HB2"] = "/hb" -- english slash command - *Do Not Localize*
	L["SLASH_HB3"] = "/hearthbag" -- localized slash command
	L["SLASH_HB4"] = "/hb" -- localized slash command

	L["HearthbagError"] = "Error de Hearthbag: %s"
	L["Hearthbag"] = "Hearthbag: %s"
	L["CantFindParent"] = "No se pudo encontrar el marco padre '%s'. Restableciendo a UIParent."
	L["ShowCFInCombat"] = "Mostrar marco de combate durante el combate"
	L["UnlockCombatFrame"] = "Desbloquear marco de anclaje de combate"
	L["Unlock"] = UNLOCK
	L["Locked"] = LOCKED
	L["CantAnchorInCombat"] = "No se puede cambiar el anclaje en combate."
	L["TempTele"] = "Teletransporte temporal"
	L["RightClick"] = "Clic derecho:"
	L["ShiftScroll"] = "MAYÚS + rueda:"
	L["ShiftDrag"] = "MAYÚS + arrastrar:"
	L["OpenSettings"] = "Abrir ajustes"
	L["Resize"] = "Cambiar tamaño"
	L["DragFrame"] = "Mover marco"
	L["RandomHearthstone"] = "Piedra de hogar aleatoria"
	L["RandomHearthstoneTT"] = "Selecciona aleatoriamente entre las piedras de hogar obtenidas"
	L["CantMoveInCombat"] = "No se puede mover en combate."
	L["FrameNotFound"] = "Marco '%s' no encontrado."
	L["ResetToUIParent"] = "Restablecer anclaje a UIParent."
	L["NotAFrame"] = "No se puede anclar a '%s'. No es un marco."
	L["RestrictedFrame"] = "No se puede anclar al marco restringido '%s'."
	L["CantAnchorToSelf"] = "No se puede anclar a sí mismo."
	L["AnchoredToFrame"] = "Anclado a %s"
	L["FrameNoName"] = "Marco no válido. No tiene nombre."
	L["ResetHearthstone"] = "Restablecer piedra de hogar a la posición centrada."
	L["HBCommands"] = "Comandos de Hearthbag:"
	L["HB_Slash_Combat1"] = "combat" -- english
	L["HB_Slash_Combat2"] = "combate" -- localized
	L["HB_Slash_Anchor1"] = "anchor" -- english
	L["HB_Slash_Anchor2"] = "anclar" -- localized
	L["HB_Slash_Reset1"] = "reset" -- english
	L["HB_Slash_Reset2"] = "reiniciar" -- localized
	L["HBCMD_combat"] = "/hearthbag combat  (/hearthbag combate) - Alterna el marco de combate movible."
	L["HBCMD_anchor"] = "/hearthbag anchor [marco]  (/hearthbag anclar) - Establece el padre al marco bajo el cursor o al nombre indicado."
	L["HBCMD_reset"] = "/hearthbag reset  (/hearthbag reiniciar) - Restablece Hearthbag al centro."

return end

if LOCALE == "esES" then
	-- Spanish translations go here
	L["TOC_Title"] = "Hearthbag"
	L["TOC_Notes"] = "Añade un botón de piedra de hogar personalizable"
	L["SLASH_HB1"] = "/hearthbag" -- english slash command - *Do Not Localize*
	L["SLASH_HB2"] = "/hb" -- english slash command - *Do Not Localize*
	L["SLASH_HB3"] = "/hearthbag" -- localized slash command
	L["SLASH_HB4"] = "/hb" -- localized slash command

	L["HearthbagError"] = "Error de Hearthbag: %s"
	L["Hearthbag"] = "Hearthbag: %s"
	L["CantFindParent"] = "No se pudo encontrar el marco padre '%s'. Restableciendo a UIParent."
	L["ShowCFInCombat"] = "Mostrar marco de combate durante el combate"
	L["UnlockCombatFrame"] = "Desbloquear marco de anclaje de combate"
	L["Unlock"] = UNLOCK
	L["Locked"] = LOCKED
	L["CantAnchorInCombat"] = "No se puede cambiar el anclaje en combate."
	L["TempTele"] = "Teletransporte temporal"
	L["RightClick"] = "Clic derecho:"
	L["ShiftScroll"] = "MAYÚS + rueda:"
	L["ShiftDrag"] = "MAYÚS + arrastrar:"
	L["OpenSettings"] = "Abrir ajustes"
	L["Resize"] = "Cambiar tamaño"
	L["DragFrame"] = "Mover marco"
	L["RandomHearthstone"] = "Piedra de hogar aleatoria"
	L["RandomHearthstoneTT"] = "Selecciona aleatoriamente entre las piedras de hogar obtenidas"
	L["CantMoveInCombat"] = "No se puede mover en combate."
	L["FrameNotFound"] = "Marco '%s' no encontrado."
	L["ResetToUIParent"] = "Restablecer anclaje a UIParent."
	L["NotAFrame"] = "No se puede anclar a '%s'. No es un marco."
	L["RestrictedFrame"] = "No se puede anclar al marco restringido '%s'."
	L["CantAnchorToSelf"] = "No se puede anclar a sí mismo."
	L["AnchoredToFrame"] = "Anclado a %s"
	L["FrameNoName"] = "Marco no válido. No tiene nombre."
	L["ResetHearthstone"] = "Restablecer piedra de hogar a la posición centrada."
	L["HBCommands"] = "Comandos de Hearthbag:"
	L["HB_Slash_Combat1"] = "combat" -- english
	L["HB_Slash_Combat2"] = "combate" -- localized
	L["HB_Slash_Anchor1"] = "anchor" -- english
	L["HB_Slash_Anchor2"] = "anclar" -- localized
	L["HB_Slash_Reset1"] = "reset" -- english
	L["HB_Slash_Reset2"] = "reiniciar" -- localized
	L["HBCMD_combat"] = "/hearthbag combat  (/hearthbag combate) - Alterna el marco de combate movible."
	L["HBCMD_anchor"] = "/hearthbag anchor [marco]  (/hearthbag anclar) - Establece el padre al marco bajo el cursor o al nombre indicado."
	L["HBCMD_reset"] = "/hearthbag reset  (/hearthbag reiniciar) - Restablece Hearthbag al centro."

return end

if LOCALE == "deDE" then
	-- German translations go here
	L["TOC_Title"] = "Hearthbag"
	L["TOC_Notes"] = "Fügt einen anpassbaren Ruhestein-Button hinzu"
	L["SLASH_HB1"] = "/hearthbag" -- english slash command - *Do Not Localize*
	L["SLASH_HB2"] = "/hb" -- english slash command - *Do Not Localize*
	L["SLASH_HB3"] = "/hearthbag" -- localized slash command
	L["SLASH_HB4"] = "/hb" -- localized slash command

	L["HearthbagError"] = "Hearthbag Fehler: %s"
	L["Hearthbag"] = "Hearthbag: %s"
	L["CantFindParent"] = "Übergeordnetes Fenster '%s' nicht gefunden. Setze auf UIParent zurück."
	L["ShowCFInCombat"] = "Kampffenster im Kampf anzeigen"
	L["UnlockCombatFrame"] = "Kampfanker-Fenster entsperren"
	L["Unlock"] = UNLOCK
	L["Locked"] = LOCKED
	L["CantAnchorInCombat"] = "Anker im Kampf nicht umschaltbar."
	L["TempTele"] = "Temporärer Teleport"
	L["RightClick"] = "Rechtsklick:"
	L["ShiftScroll"] = "UMSCHALT + Scrollen:"
	L["ShiftDrag"] = "UMSCHALT + Ziehen:"
	L["OpenSettings"] = "Einstellungen öffnen"
	L["Resize"] = "Größe ändern"
	L["DragFrame"] = "Fenster ziehen"
	L["RandomHearthstone"] = "Zufälliger Ruhestein"
	L["RandomHearthstoneTT"] = "Wählt zufällig aus besessenen Ruhesteinen"
	L["CantMoveInCombat"] = "Im Kampf nicht bewegbar."
	L["FrameNotFound"] = "Fenster '%s' nicht gefunden."
	L["ResetToUIParent"] = "Anker auf UIParent zurücksetzen."
	L["NotAFrame"] = "Kann nicht an '%s' verankern. Kein Frame."
	L["RestrictedFrame"] = "Kann nicht an geschütztes Fenster '%s' verankern."
	L["CantAnchorToSelf"] = "Kann nicht an sich selbst verankern."
	L["AnchoredToFrame"] = "Verankert an %s"
	L["FrameNoName"] = "Ungültiges Fenster ohne Namen."
	L["ResetHearthstone"] = "Ruhestein auf Mitte zurücksetzen."
	L["HBCommands"] = "Hearthbag Befehle:"
	L["HB_Slash_Combat1"] = "combat" -- english
	L["HB_Slash_Combat2"] = "kampf" -- localized
	L["HB_Slash_Anchor1"] = "anchor" -- english
	L["HB_Slash_Anchor2"] = "anker" -- localized
	L["HB_Slash_Reset1"] = "reset" -- english
	L["HB_Slash_Reset2"] = "reset" -- localized
	L["HBCMD_combat"] = "/hearthbag combat  (/hearthbag kampf) - Bewegliches Kampffenster umschalten."
	L["HBCMD_anchor"] = "/hearthbag anchor [Fenstername]  (/hearthbag anker) - Parent auf Frame unter Maus setzen."
	L["HBCMD_reset"] = "/hearthbag reset  (/hearthbag reset) - Hearthbag zentrieren."

return end

if LOCALE == "frFR" then
	-- French translations go here
	L["TOC_Title"] = "Hearthbag"
	L["TOC_Notes"] = "Ajoute un bouton de pierre de foyer personnalisable"
	L["SLASH_HB1"] = "/hearthbag" -- english slash command - *Do Not Localize*
	L["SLASH_HB2"] = "/hb" -- english slash command - *Do Not Localize*
	L["SLASH_HB3"] = "/hearthbag" -- localized slash command
	L["SLASH_HB4"] = "/hb" -- localized slash command

	L["HearthbagError"] = "Erreur Hearthbag : %s"
	L["Hearthbag"] = "Hearthbag : %s"
	L["CantFindParent"] = "Impossible de trouver la fenêtre parente '%s'. Réinitialisation sur UIParent."
	L["ShowCFInCombat"] = "Afficher la fenêtre de combat en combat"
	L["UnlockCombatFrame"] = "Déverrouiller l’ancrage de combat"
	L["Unlock"] = UNLOCK
	L["Locked"] = LOCKED
	L["CantAnchorInCombat"] = "Impossible d’ancrer en combat."
	L["TempTele"] = "Téléportation temporaire"
	L["RightClick"] = "Clic droit :"
	L["ShiftScroll"] = "MAJ + molette :"
	L["ShiftDrag"] = "MAJ + déplacer :"
	L["OpenSettings"] = "Ouvrir les options"
	L["Resize"] = "Redimensionner"
	L["DragFrame"] = "Déplacer la fenêtre"
	L["RandomHearthstone"] = "Pierre de foyer aléatoire"
	L["RandomHearthstoneTT"] = "Sélectionne aléatoirement parmi vos pierres de foyer"
	L["CantMoveInCombat"] = "Impossible de déplacer en combat."
	L["FrameNotFound"] = "Fenêtre '%s' introuvable."
	L["ResetToUIParent"] = "Réinitialiser l’ancrage à UIParent."
	L["NotAFrame"] = "Impossible d’ancrer à '%s'. Ce n’est pas une fenêtre."
	L["RestrictedFrame"] = "Impossible d’ancrer à la fenêtre protégée '%s'."
	L["CantAnchorToSelf"] = "Impossible de s’ancrer à soi-même."
	L["AnchoredToFrame"] = "Ancré à %s"
	L["FrameNoName"] = "Fenêtre invalide sans nom."
	L["ResetHearthstone"] = "Réinitialiser la pierre de foyer au centre."
	L["HBCommands"] = "Commandes Hearthbag :"
	L["HB_Slash_Combat1"] = "combat" -- english
	L["HB_Slash_Combat2"] = "combat" -- localized
	L["HB_Slash_Anchor1"] = "anchor" -- english
	L["HB_Slash_Anchor2"] = "ancrer" -- localized
	L["HB_Slash_Reset1"] = "reset" -- english
	L["HB_Slash_Reset2"] = "reinit" -- localized
	L["HBCMD_combat"] = "/hearthbag combat  (/hearthbag combat) - Active/désactive la fenêtre de combat mobile."
	L["HBCMD_anchor"] = "/hearthbag anchor [fenêtre]  (/hearthbag ancrer) - Définit la fenêtre parente."
	L["HBCMD_reset"] = "/hearthbag reset  (/hearthbag reinit) - Réinitialise la position."

return end

if LOCALE == "itIT" then
	-- Italian translations go here
	L["TOC_Title"] = "Hearthbag"
	L["TOC_Notes"] = "Aggiunge un pulsante Pietra del Ritorno personalizzabile"
	L["SLASH_HB1"] = "/hearthbag" -- english slash command - *Do Not Localize*
	L["SLASH_HB2"] = "/hb" -- english slash command - *Do Not Localize*
	L["SLASH_HB3"] = "/hearthbag" -- localized slash command
	L["SLASH_HB4"] = "/hb" -- localized slash command

	L["HearthbagError"] = "Errore Hearthbag: %s"
	L["Hearthbag"] = "Hearthbag: %s"
	L["CantFindParent"] = "Impossibile trovare il frame padre '%s'. Reimpostazione a UIParent."
	L["ShowCFInCombat"] = "Mostra il riquadro di combattimento durante il combattimento"
	L["UnlockCombatFrame"] = "Sblocca il riquadro di ancoraggio del combattimento"
	L["Unlock"] = UNLOCK
	L["Locked"] = LOCKED
	L["CantAnchorInCombat"] = "Impossibile cambiare ancoraggio in combattimento."
	L["TempTele"] = "Teletrasporto temporaneo"
	L["RightClick"] = "Clic destro:"
	L["ShiftScroll"] = "MAIUSC + rotella:"
	L["ShiftDrag"] = "MAIUSC + trascina:"
	L["OpenSettings"] = "Apri impostazioni"
	L["Resize"] = "Ridimensiona"
	L["DragFrame"] = "Trascina riquadro"
	L["RandomHearthstone"] = "Pietra del Ritorno casuale"
	L["RandomHearthstoneTT"] = "Seleziona casualmente tra le pietre del ritorno possedute"
	L["CantMoveInCombat"] = "Impossibile muovere in combattimento."
	L["FrameNotFound"] = "Frame '%s' non trovato."
	L["ResetToUIParent"] = "Reimposta ancoraggio a UIParent."
	L["NotAFrame"] = "Impossibile ancorare a '%s'. Non è un Frame."
	L["RestrictedFrame"] = "Impossibile ancorare al frame protetto '%s'."
	L["CantAnchorToSelf"] = "Impossibile ancorare a se stessi."
	L["AnchoredToFrame"] = "Ancorato a %s"
	L["FrameNoName"] = "Frame non valido. Non ha nome."
	L["ResetHearthstone"] = "Reimposta la pietra del ritorno al centro."
	L["HBCommands"] = "Comandi Hearthbag:"
	L["HB_Slash_Combat1"] = "combat" -- english
	L["HB_Slash_Combat2"] = "combat" -- localized
	L["HB_Slash_Anchor1"] = "anchor" -- english
	L["HB_Slash_Anchor2"] = "ancora" -- localized
	L["HB_Slash_Reset1"] = "reset" -- english
	L["HB_Slash_Reset2"] = "reset" -- localized
	L["HBCMD_combat"] = "/hearthbag combat  (/hearthbag combat) - Attiva/disattiva il riquadro di combattimento mobile."
	L["HBCMD_anchor"] = "/hearthbag anchor [nomeframe]  (/hearthbag ancora) - Imposta il genitore al frame sotto il mouse o a quello indicato."
	L["HBCMD_reset"] = "/hearthbag reset  (/hearthbag reset) - Reimposta Hearthbag al centro."

return end

if LOCALE == "ptBR" then
	-- Brazilian Portuguese translations go here
	L["TOC_Title"] = "Hearthbag"
	L["TOC_Notes"] = "Adiciona um botão de Pedra de Regresso personalizável"
	L["SLASH_HB1"] = "/hearthbag" -- english slash command - *Do Not Localize*
	L["SLASH_HB2"] = "/hb" -- english slash command - *Do Not Localize*
	L["SLASH_HB3"] = "/hearthbag" -- localized slash command
	L["SLASH_HB4"] = "/hb" -- localized slash command

	L["HearthbagError"] = "Erro Hearthbag: %s"
	L["Hearthbag"] = "Hearthbag: %s"
	L["CantFindParent"] = "Não foi possível encontrar o quadro pai '%s'. Redefinindo para UIParent."
	L["ShowCFInCombat"] = "Mostrar quadro de combate durante o combate"
	L["UnlockCombatFrame"] = "Desbloquear quadro âncora de combate"
	L["Unlock"] = UNLOCK
	L["Locked"] = LOCKED
	L["CantAnchorInCombat"] = "Não é possível alterar âncora em combate."
	L["TempTele"] = "Teleporte temporário"
	L["RightClick"] = "Clique direito:"
	L["ShiftScroll"] = "SHIFT + rolagem:"
	L["ShiftDrag"] = "SHIFT + arrastar:"
	L["OpenSettings"] = "Abrir configurações"
	L["Resize"] = "Redimensionar"
	L["DragFrame"] = "Arrastar quadro"
	L["RandomHearthstone"] = "Pedra de Regresso aleatória"
	L["RandomHearthstoneTT"] = "Seleciona aleatoriamente entre as pedras de regresso possuídas"
	L["CantMoveInCombat"] = "Não é possível mover em combate."
	L["FrameNotFound"] = "Quadro '%s' não encontrado."
	L["ResetToUIParent"] = "Redefinir âncora para UIParent."
	L["NotAFrame"] = "Não é possível ancorar a '%s'. Não é um Frame."
	L["RestrictedFrame"] = "Não é possível ancorar ao quadro restrito '%s'."
	L["CantAnchorToSelf"] = "Não é possível ancorar a si mesmo."
	L["AnchoredToFrame"] = "Ancorado a %s"
	L["FrameNoName"] = "Quadro inválido. Sem nome."
	L["ResetHearthstone"] = "Redefinir pedra de regresso ao centro."
	L["HBCommands"] = "Comandos Hearthbag:"
	L["HB_Slash_Combat1"] = "combat" -- english
	L["HB_Slash_Combat2"] = "combate" -- localized
	L["HB_Slash_Anchor1"] = "anchor" -- english
	L["HB_Slash_Anchor2"] = "ancorar" -- localized
	L["HB_Slash_Reset1"] = "reset" -- english
	L["HB_Slash_Reset2"] = "reset" -- localized
	L["HBCMD_combat"] = "/hearthbag combat  (/hearthbag combate) - Alterna o quadro de combate móvel."
	L["HBCMD_anchor"] = "/hearthbag anchor [frame]  (/hearthbag ancorar) - Define o quadro pai."
	L["HBCMD_reset"] = "/hearthbag reset  (/hearthbag reset) - Redefine a posição."

-- Note that the EU Portuguese WoW client also
-- uses the Brazilian Portuguese locale code.
return end

if LOCALE == "ruRU" then
	-- Russian translations go here
	L["TOC_Title"] = "Hearthbag"
	L["TOC_Notes"] = "Добавляет настраиваемую кнопку камня возвращения"
	L["SLASH_HB1"] = "/hearthbag" -- english slash command - *Do Not Localize*
	L["SLASH_HB2"] = "/hb" -- english slash command - *Do Not Localize*
	L["SLASH_HB3"] = "/очаг" -- localized slash command
	L["SLASH_HB4"] = "/hb" -- localized slash command

	L["HearthbagError"] = "Ошибка Hearthbag: %s"
	L["Hearthbag"] = "Hearthbag: %s"
	L["CantFindParent"] = "Не удалось найти родительский фрейм '%s'. Сброс к UIParent."
	L["ShowCFInCombat"] = "Показывать боевое окно в бою"
	L["UnlockCombatFrame"] = "Разблокировать якорь боевого окна"
	L["Unlock"] = UNLOCK
	L["Locked"] = LOCKED
	L["CantAnchorInCombat"] = "Нельзя изменить якорь в бою."
	L["TempTele"] = "Временная телепортация"
	L["RightClick"] = "Правый клик:"
	L["ShiftScroll"] = "SHIFT + прокрутка:"
	L["ShiftDrag"] = "SHIFT + перетаскивание:"
	L["OpenSettings"] = "Открыть настройки"
	L["Resize"] = "Изменить размер"
	L["DragFrame"] = "Переместить окно"
	L["RandomHearthstone"] = "Случайный камень возвращения"
	L["RandomHearthstoneTT"] = "Случайно выбирает из доступных камней возвращения"
	L["CantMoveInCombat"] = "Нельзя перемещать в бою."
	L["FrameNotFound"] = "Фрейм '%s' не найден."
	L["ResetToUIParent"] = "Сбросить якорь к UIParent."
	L["NotAFrame"] = "Нельзя привязать к '%s'. Это не фрейм."
	L["RestrictedFrame"] = "Нельзя привязать к защищённому фрейму '%s'."
	L["CantAnchorToSelf"] = "Нельзя привязать к самому себе."
	L["AnchoredToFrame"] = "Привязан к %s"
	L["FrameNoName"] = "Недопустимый фрейм без имени."
	L["ResetHearthstone"] = "Сбросить камень возвращения в центр."
	L["HBCommands"] = "Команды Hearthbag:"
	L["HB_Slash_Combat1"] = "combat" -- english
	L["HB_Slash_Combat2"] = "бой" -- localized
	L["HB_Slash_Anchor1"] = "anchor" -- english
	L["HB_Slash_Anchor2"] = "якорь" -- localized
	L["HB_Slash_Reset1"] = "reset" -- english
	L["HB_Slash_Reset2"] = "сброс" -- localized
	L["HBCMD_combat"] = "/hearthbag combat  (/очаг бой) - Переключить подвижное боевое окно."
	L["HBCMD_anchor"] = "/hearthbag anchor [имя]  (/очаг якорь) - Установить родительский фрейм."
	L["HBCMD_reset"] = "/hearthbag reset  (/очаг сброс) - Сбросить позицию."

return end

if LOCALE == "koKR" then
	-- Korean translations go here
	L["TOC_Title"] = "Hearthbag"
	L["TOC_Notes"] = "사용자 설정 귀환석 버튼을 추가합니다"
	L["SLASH_HB1"] = "/hearthbag" -- english slash command - *Do Not Localize*
	L["SLASH_HB2"] = "/hb" -- english slash command - *Do Not Localize*
	L["SLASH_HB3"] = "/귀환" -- localized slash command
	L["SLASH_HB4"] = "/hb" -- localized slash command

	L["HearthbagError"] = "Hearthbag 오류: %s"
	L["Hearthbag"] = "Hearthbag: %s"
	L["CantFindParent"] = "부모 프레임 '%s'을 찾을 수 없습니다. UIParent로 초기화합니다."
	L["ShowCFInCombat"] = "전투 중 전투 프레임 표시"
	L["UnlockCombatFrame"] = "전투 앵커 프레임 잠금 해제"
	L["Unlock"] = UNLOCK
	L["Locked"] = LOCKED
	L["CantAnchorInCombat"] = "전투 중 앵커 변경 불가."
	L["TempTele"] = "임시 순간이동"
	L["RightClick"] = "우클릭:"
	L["ShiftScroll"] = "SHIFT + 스크롤:"
	L["ShiftDrag"] = "SHIFT + 드래그:"
	L["OpenSettings"] = "설정 열기"
	L["Resize"] = "크기 조절"
	L["DragFrame"] = "프레임 이동"
	L["RandomHearthstone"] = "무작위 귀환석"
	L["RandomHearthstoneTT"] = "보유한 귀환석 중 무작위 선택"
	L["CantMoveInCombat"] = "전투 중 이동 불가."
	L["FrameNotFound"] = "프레임 '%s' 찾을 수 없음."
	L["ResetToUIParent"] = "UIParent로 앵커 초기화."
	L["NotAFrame"] = "'%s'에 앵커 불가. 프레임이 아님."
	L["RestrictedFrame"] = "보호된 프레임 '%s'에 앵커 불가."
	L["CantAnchorToSelf"] = "자기 자신에 앵커 불가."
	L["AnchoredToFrame"] = "%s에 앵커됨"
	L["FrameNoName"] = "유효하지 않은 프레임 (이름 없음)."
	L["ResetHearthstone"] = "귀환석을 중앙으로 초기화."
	L["HBCommands"] = "Hearthbag 명령어:"
	L["HB_Slash_Combat1"] = "combat" -- english
	L["HB_Slash_Combat2"] = "전투" -- localized
	L["HB_Slash_Anchor1"] = "anchor" -- english
	L["HB_Slash_Anchor2"] = "앵커" -- localized
	L["HB_Slash_Reset1"] = "reset" -- english
	L["HB_Slash_Reset2"] = "초기화" -- localized
	L["HBCMD_combat"] = "/hearthbag combat  (/귀환 전투) - 이동 가능한 전투 프레임 전환."
	L["HBCMD_anchor"] = "/hearthbag anchor [프레임]  (/귀환 앵커) - 부모 프레임 설정."
	L["HBCMD_reset"] = "/hearthbag reset  (/귀환 초기화) - 위치 초기화."

return end

if LOCALE == "zhCN" then
	-- Simplified Chinese translations go here
	L["TOC_Title"] = "Hearthbag"
	L["TOC_Notes"] = "添加可自定义的炉石按钮"
	L["SLASH_HB1"] = "/hearthbag" -- english slash command - *Do Not Localize*
	L["SLASH_HB2"] = "/hb" -- english slash command - *Do Not Localize*
	L["SLASH_HB3"] = "/炉石" -- localized slash command
	L["SLASH_HB4"] = "/hb" -- localized slash command

	L["HearthbagError"] = "Hearthbag 错误：%s"
	L["Hearthbag"] = "Hearthbag：%s"
	L["CantFindParent"] = "找不到父框体 '%s'，已重置为 UIParent。"
	L["ShowCFInCombat"] = "战斗中显示战斗框体"
	L["UnlockCombatFrame"] = "解锁战斗锚点框体"
	L["Unlock"] = UNLOCK
	L["Locked"] = LOCKED
	L["CantAnchorInCombat"] = "战斗中无法更改锚点。"
	L["TempTele"] = "临时传送"
	L["RightClick"] = "右键："
	L["ShiftScroll"] = "SHIFT + 滚轮："
	L["ShiftDrag"] = "SHIFT + 拖动："
	L["OpenSettings"] = "打开设置"
	L["Resize"] = "调整大小"
	L["DragFrame"] = "拖动框体"
	L["RandomHearthstone"] = "随机炉石"
	L["RandomHearthstoneTT"] = "从已拥有的炉石中随机选择"
	L["CantMoveInCombat"] = "战斗中无法移动。"
	L["FrameNotFound"] = "未找到框体 '%s'。"
	L["ResetToUIParent"] = "锚点重置为 UIParent。"
	L["NotAFrame"] = "无法锚定到 '%s'，它不是框体。"
	L["RestrictedFrame"] = "无法锚定到受保护的框体 '%s'。"
	L["CantAnchorToSelf"] = "无法锚定到自身。"
	L["AnchoredToFrame"] = "已锚定到 %s"
	L["FrameNoName"] = "无效框体：没有名称。"
	L["ResetHearthstone"] = "炉石重置为居中位置。"
	L["HBCommands"] = "Hearthbag 命令："
	L["HB_Slash_Combat1"] = "combat" -- english
	L["HB_Slash_Combat2"] = "战斗" -- localized
	L["HB_Slash_Anchor1"] = "anchor" -- english
	L["HB_Slash_Anchor2"] = "锚定" -- localized
	L["HB_Slash_Reset1"] = "reset" -- english
	L["HB_Slash_Reset2"] = "重置" -- localized
	L["HBCMD_combat"] = "/hearthbag combat  (/炉石 战斗) - 切换可移动战斗框体。"
	L["HBCMD_anchor"] = "/hearthbag anchor [框体名]  (/炉石 锚定) - 设置父框体。"
	L["HBCMD_reset"] = "/hearthbag reset  (/炉石 重置) - 重置位置。"

return end

if LOCALE == "zhTW" then
	-- Traditional Chinese translations go here
	L["TOC_Title"] = "Hearthbag"
	L["TOC_Notes"] = "新增可自訂的爐石按鈕"
	L["SLASH_HB1"] = "/hearthbag" -- english slash command - *Do Not Localize*
	L["SLASH_HB2"] = "/hb" -- english slash command - *Do Not Localize*
	L["SLASH_HB3"] = "/爐石" -- localized slash command
	L["SLASH_HB4"] = "/hb" -- localized slash command

	L["HearthbagError"] = "Hearthbag 錯誤：%s"
	L["Hearthbag"] = "Hearthbag：%s"
	L["CantFindParent"] = "找不到父框架 '%s'，已重設為 UIParent。"
	L["ShowCFInCombat"] = "戰鬥中顯示戰鬥框架"
	L["UnlockCombatFrame"] = "解鎖戰鬥錨點框架"
	L["Unlock"] = UNLOCK
	L["Locked"] = LOCKED
	L["CantAnchorInCombat"] = "戰鬥中無法變更錨點。"
	L["TempTele"] = "暫時傳送"
	L["RightClick"] = "右鍵："
	L["ShiftScroll"] = "SHIFT + 滾輪："
	L["ShiftDrag"] = "SHIFT + 拖曳："
	L["OpenSettings"] = "開啟設定"
	L["Resize"] = "調整大小"
	L["DragFrame"] = "拖曳框架"
	L["RandomHearthstone"] = "隨機爐石"
	L["RandomHearthstoneTT"] = "從已擁有的爐石中隨機選擇"
	L["CantMoveInCombat"] = "戰鬥中無法移動。"
	L["FrameNotFound"] = "找不到框架 '%s'。"
	L["ResetToUIParent"] = "錨點重設為 UIParent。"
	L["NotAFrame"] = "無法錨定到 '%s'，它不是框架。"
	L["RestrictedFrame"] = "無法錨定到受保護的框架 '%s'。"
	L["CantAnchorToSelf"] = "無法錨定到自身。"
	L["AnchoredToFrame"] = "已錨定到 %s"
	L["FrameNoName"] = "無效框架：沒有名稱。"
	L["ResetHearthstone"] = "爐石重設為置中位置。"
	L["HBCommands"] = "Hearthbag 指令："
	L["HB_Slash_Combat1"] = "combat" -- english
	L["HB_Slash_Combat2"] = "戰鬥" -- localized
	L["HB_Slash_Anchor1"] = "anchor" -- english
	L["HB_Slash_Anchor2"] = "錨定" -- localized
	L["HB_Slash_Reset1"] = "reset" -- english
	L["HB_Slash_Reset2"] = "重設" -- localized
	L["HBCMD_combat"] = "/hearthbag combat  (/爐石 戰鬥) - 切換可移動戰鬥框架。"
	L["HBCMD_anchor"] = "/hearthbag anchor [框架名]  (/爐石 錨定) - 設定父框架。"
	L["HBCMD_reset"] = "/hearthbag reset  (/爐石 重設) - 重設位置。"

return end
