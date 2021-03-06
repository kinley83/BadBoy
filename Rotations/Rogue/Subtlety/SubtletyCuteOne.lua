if select(2, UnitClass("player")) == "ROGUE" then
    local rotationName = "CuteOne"

---------------
--- Toggles ---
---------------
    local function createToggles()
    -- Rotation Button
        RotationModes = {
            [1] = { mode = "Auto", value = 1 , overlay = "Automatic Rotation", tip = "Swaps between Single and Multiple based on number of targets in range.", highlight = 1, icon = bb.player.spell.shurikenStorm },
            [2] = { mode = "Mult", value = 2 , overlay = "Multiple Target Rotation", tip = "Multiple target rotation used.", highlight = 0, icon = bb.player.spell.shurikenStorm },
            [3] = { mode = "Sing", value = 3 , overlay = "Single Target Rotation", tip = "Single target rotation used.", highlight = 0, icon = bb.player.spell.backstab },
            [4] = { mode = "Off", value = 4 , overlay = "DPS Rotation Disabled", tip = "Disable DPS Rotation", highlight = 0, icon = bb.player.spell.crimsonVial}
        };
        CreateButton("Rotation",1,0)
    -- Cooldown Button
        CooldownModes = {
            [1] = { mode = "Auto", value = 1 , overlay = "Cooldowns Automated", tip = "Automatic Cooldowns - Boss Detection.", highlight = 1, icon = bb.player.spell.shadowBlades },
            [2] = { mode = "On", value = 1 , overlay = "Cooldowns Enabled", tip = "Cooldowns used regardless of target.", highlight = 0, icon = bb.player.spell.shadowBlades },
            [3] = { mode = "Off", value = 3 , overlay = "Cooldowns Disabled", tip = "No Cooldowns will be used.", highlight = 0, icon = bb.player.spell.shadowBlades }
        };
        CreateButton("Cooldown",2,0)
    -- Defensive Button
        DefensiveModes = {
            [1] = { mode = "On", value = 1 , overlay = "Defensive Enabled", tip = "Includes Defensive Cooldowns.", highlight = 1, icon = bb.player.spell.evasion },
            [2] = { mode = "Off", value = 2 , overlay = "Defensive Disabled", tip = "No Defensives will be used.", highlight = 0, icon = bb.player.spell.evasion }
        };
        CreateButton("Defensive",3,0)
    -- Interrupt Button
        InterruptModes = {
            [1] = { mode = "On", value = 1 , overlay = "Interrupts Enabled", tip = "Includes Basic Interrupts.", highlight = 1, icon = bb.player.spell.kick },
            [2] = { mode = "Off", value = 2 , overlay = "Interrupts Disabled", tip = "No Interrupts will be used.", highlight = 0, icon = bb.player.spell.kick }
        };
        CreateButton("Interrupt",4,0)
    -- Cleave Button
        CleaveModes = {
            [1] = { mode = "On", value = 1 , overlay = "Cleaving Enabled", tip = "Rotation will cleave targets.", highlight = 1, icon = bb.player.spell.shurikenStorm },
            [2] = { mode = "Off", value = 2 , overlay = "Cleaving Disabled", tip = "Rotation will not cleave targets", highlight = 0, icon = bb.player.spell.backstab }
        };
        CreateButton("Cleave",5,0)
    -- Pick Pocket Button
      	PickerModes = {
          [1] = { mode = "Auto", value = 2 , overlay = "Auto Pick Pocket Enabled", tip = "Profile will attempt to Pick Pocket prior to combat.", highlight = 1, icon = bb.player.spell.pickPocket},
          [2] = { mode = "Only", value = 1 , overlay = "Only Pick Pocket Enabled", tip = "Profile will attempt to Sap and only Pick Pocket, no combat.", highlight = 0, icon = bb.player.spell.pickPocket},
          [3] = { mode = "Off", value = 3, overlay = "Pick Pocket Disabled", tip = "Profile will not use Pick Pocket.", highlight = 0, icon = bb.player.spell.pickPocket}
        };
        CreateButton("Picker",6,0)
    end

---------------
--- OPTIONS ---
---------------
    local function createOptions()
        local optionTable

        local function rotationOptions()
            -----------------------
            --- GENERAL OPTIONS ---
            -----------------------
            section = bb.ui:createSection(bb.ui.window.profile,  "General")
            	-- Stealth
	            bb.ui:createDropdown(section,  "Stealth", {"|cff00FF00Always", "|cffFFDD00PrePot", "|cffFF000020Yards"},  1, "Stealthing method.")
	            -- Shadowstep
	            bb.ui:createCheckbox(section,  "Shadowstep")
	            -- Pre-Pull Timer
	            bb.ui:createSpinner(section, "Pre-Pull Timer",  5,  1,  10,  1,  "|cffFFFFFFSet to desired time to start Pre-Pull (DBM Required). Min: 1 / Max: 10 / Interval: 1")
	            -- Dummy DPS Test
                bb.ui:createSpinner(section, "DPS Testing",  5,  5,  60,  5,  "|cffFFFFFFSet to desired time for test in minuts. Min: 5 / Max: 60 / Interval: 5")
            bb.ui:checkSectionState(section)
            ------------------------
            --- COOLDOWN OPTIONS ---
            ------------------------
            section = bb.ui:createSection(bb.ui.window.profile,  "Cooldowns")
                -- Agi Pot
	            bb.ui:createCheckbox(section, "Agi-Pot")
	            -- Legendary Ring
	            bb.ui:createCheckbox(section, "Legendary Ring")
	            -- Shadow Dance
	            bb.ui:createCheckbox(section, "Shadow Dance")
	            -- Vanish
	            bb.ui:createCheckbox(section, "Vanish")
            bb.ui:checkSectionState(section)
            -------------------------
            --- DEFENSIVE OPTIONS ---
            -------------------------
            section = bb.ui:createSection(bb.ui.window.profile, "Defensive")
            	-- Healthstone
	            bb.ui:createSpinner(section, "Healthstone",  60,  0,  100,  5,  "|cffFFBB00Health Percentage to use at.")
	            -- Heirloom Neck
	            bb.ui:createSpinner(section, "Heirloom Neck",  60,  0,  100,  5,  "|cffFFBB00Health Percentage to use at.")
	            -- Evasion
	            bb.ui:createSpinner(section, "Evasion",  50,  0,  100,  5,  "|cffFFBB00Health Percentage to use at.")
	            -- Crimson Vial
	            bb.ui:createSpinner(section, "Crimson Vial",  50,  0,  100,  5,  "|cffFFBB00Health Percentage to use at.")
            bb.ui:checkSectionState(section)
            -------------------------
            --- INTERRUPT OPTIONS ---
            -------------------------
            section = bb.ui:createSection(bb.ui.window.profile, "Interrupts")
            	-- Kick
	            bb.ui:createCheckbox(section, "Kick")
	            -- Kidney Shot
	            bb.ui:createCheckbox(section, "Kidney Shot")
	            -- Blind
            	bb.ui:createCheckbox(section, "Blind")
	            -- Interrupt Percentage
	            bb.ui:createSpinner(section, "Interrupt At",  0,  0,  95,  5,  "|cffFFBB00Cast Percentage to use at.")    
            bb.ui:checkSectionState(section)
            ----------------------
            --- TOGGLE OPTIONS ---
            ----------------------
            section = bb.ui:createSection(bb.ui.window.profile,  "Toggle Keys")
            	-- Single/Multi Toggle
	            bb.ui:createDropdown(section,  "Rotation Mode", bb.dropOptions.Toggle,  4)
	            --Cooldown Key Toggle
	            bb.ui:createDropdown(section,  "Cooldown Mode", bb.dropOptions.Toggle,  3)
	            --Defensive Key Toggle
	            bb.ui:createDropdown(section,  "Defensive Mode", bb.dropOptions.Toggle,  6)
	            -- Interrupts Key Toggle
	            bb.ui:createDropdown(section,  "Interrupt Mode", bb.dropOptions.Toggle,  6)
	            -- Cleave Toggle
	            bb.ui:createDropdown(section,  "Cleave Mode", bb.dropOptions.Toggle,  6)
	            -- Pick Pocket Toggle
	            bb.ui:createDropdown(section,  "Pick Pocket Mode", bb.dropOptions.Toggle,  6)
	            -- Pause Toggle
	            bb.ui:createDropdown(section,  "Pause Mode", bb.dropOptions.Toggle,  6)   
            bb.ui:checkSectionState(section)
        end
        optionTable = {{
            [1] = "Rotation Options",
            [2] = rotationOptions,
        }}
        return optionTable
    end

----------------
--- ROTATION ---
----------------
    local function runRotation()
        if bb.timer:useTimer("debugSubtlety", math.random(0.15,0.3)) then
            --print("Running: "..rotationName)

    ---------------
    --- Toggles ---
    ---------------
            UpdateToggle("Rotation",0.25)
            UpdateToggle("Cooldown",0.25)
            UpdateToggle("Defensive",0.25)
            UpdateToggle("Interrupt",0.25)
            UpdateToggle("Cleave",0.25)
            UpdateToggle("Picker",0.25)

	--------------
	--- Locals ---
	--------------
			if leftCombat == nil then leftCombat = GetTime() end
			if profileStop == nil then profileStop = false end
			local artifact 										= bb.player.artifact
			local attacktar 									= UnitCanAttack("target","player")
			local buff, buffRemain								= bb.player.buff, bb.player.buff.remain
			local cast 											= bb.player.cast
			local cd 											= bb.player.cd
			local charges 										= bb.player.charges
			local combo, comboDeficit, comboMax					= bb.player.comboPoints, bb.player.comboPointsMax - bb.player.comboPoints, bb.player.comboPointsMax
			local deadtar										= UnitIsDeadOrGhost("target")
			local debuff 										= bb.player.debuff
			local dynTar5 										= bb.player.units.dyn5 --Melee
			local dynTar15 										= bb.player.units.dyn15 
			local dynTar20AoE 									= bb.player.units.dyn20AoE --Stealth
			local dynTar30AoE 									= bb.player.units.dyn30AoE
			local dynTable5										= (bb.data['Cleave']==1 and bb.enemy) or { [1] = {["unit"]=dynTar5, ["distance"] = getDistance(dynTar5)}}
			local dynTable15									= (bb.data['Cleave']==1 and bb.enemy) or { [1] = {["unit"]=dynTar15, ["distance"] = getDistance(dynTar15)}}
			local dynTable20AoE 								= (bb.data['Cleave']==1 and bb.enemy) or { [1] = {["unit"]=dynTar20AoE, ["distance"] = getDistance(dynTar20AoE)}}
			local enemies										= bb.player.enemies
			local flaskBuff, canFlask							= getBuffRemain("player",bb.player.flask.wod.buff.agilityBig), canUse(bb.player.flask.wod.agilityBig)	
			local gcd 											= bb.player.gcd
			local glyph				 							= bb.player.glyph
			local hastar 										= ObjectExists("target")
			local healPot 										= getHealthPot()
			local inCombat 										= bb.player.inCombat
			local lastSpell 									= lastSpellCast
			local level											= bb.player.level
			local mode 											= bb.player.mode
			local multidot 										= (useCleave() or bb.player.mode.rotation ~= 3)
			local perk											= bb.player.perk
			local php											= bb.player.health
			local power, powerDeficit, powerRegen				= bb.player.power, bb.player.powerDeficit, bb.player.powerRegen
			local pullTimer 									= bb.DBM:getPulltimer()
			local solo											= GetNumGroupMembers() == 0	
			local spell 										= bb.player.spell
			local stealth 										= bb.player.stealth
			local t18_4pc 										= bb.player.eq.t18_4pc
			local talent 										= bb.player.talent
			local time 											= getCombatTime()
			local ttd 											= getTTD
			local ttm 											= bb.player.timeToMax
			local units 										= bb.player.units

			if talent.masterOfShadows then mosTalent = 1 else mosTalent = 0	end
			if talent.premeditation then premed = 1 else premed = 0 end
			if vanishTime == nil then vanishTime = GetTime() end

	--------------------
	--- Action Lists ---
	--------------------
		-- Action List - Extras
			local function actionList_Extras()
			-- Dummy Test
	            if isChecked("DPS Testing") then
	                if GetObjectExists("target") then
	                    if getCombatTime() >= (tonumber(getOptionValue("DPS Testing"))*60) and isDummy() then
	                        StopAttack()
	                        ClearTarget()
	                        ChatOverlay(tonumber(getOptionValue("DPS Testing")) .." Minute Dummy Test Concluded - Profile Stopped")
	                        profileStop = true
	                    end
	                end
	            end
	    	-- Pick Pocket
	        	if usePickPocket() then
        			if UnitCanAttack(units.dyn5,"player") and (UnitExists(units.dyn5) or mode.pickPocket == 2) and mode.pickPocket ~= 3 then
	        			if not isPicked(units.dyn5) and not isDummy() then
	        				if debuff.remain.sap < 1 and mode.pickPocket ~= 1 then
	        					if cast.sap(units.dyn5) then return end
	        				end
	        				if cast.pickPocket() then return end
	        			end
	        		end
	        	end
			end -- End Action List - Extras
		-- Action List - Defensives
			local function actionList_Defensive()
				if useDefensive() and not stealth then
	           	-- Heirloom Neck
		    		if isChecked("Heirloom Neck") and php <= getOptionValue("Heirloom Neck") and not inCombat then
		    			if hasEquiped(122668) then
		    				if GetItemCooldown(122668)==0 then
		    					useItem(122668)
		    				end
		    			end
		    		end
				-- Pot/Stoned
		            if isChecked("Healthstone") and php <= getOptionValue("Healthstone") and inCombat and hasHealthPot() then
	                    if canUse(5512) then
	                        useItem(5512)
	                    elseif canUse(healPot) then
	                        useItem(healPot)
	                    end
		            end
		        -- Crimson Vial
					if isChecked("Crimson Vial") and php < getOptionValue("Crimson Vial") then
						if cast.crimsonVial() then return end
					end
	            -- Evasion
	                if isChecked("Evasion") and php < getOptionValue("Evasion") and inCombat then
	                    if cast.evasion() then return end
	                end
	            end
			end -- End Action List - Defensive
		-- Action List - Interrupts
			local function actionList_Interrupts()
				if useInterrupts() and not stealth then
					for i=1, #enemies.yards20 do
						local thisUnit = enemies.yards20[i]
						local distance = getDistance(thisUnit)
						if canInterrupt(thisUnit,getOptionValue("Interrupt At")) then
				-- Kick
							-- kick
							if isChecked("Kick") and distance < 5 then
								if cast.kick(thisUnit) then return end
							end
				-- Kidney Shot
							if cd.kick ~= 0 and cd.blind == 0 then
								if isChecked("Kidney Shot") then
									if cast.kidneyShot(thisUnit) then return end
								end
							end
							if isChecked("Blind") and (cd.kick ~= 0 or distance >= 5) then
				-- Blind
								if cast.blind(thisUnit) then return end
							end
						end
					end	
				end -- End Interrupt and No Stealth Check
			end -- End Action List - Interrupts
		-- Action List - Cooldowns
			local function actionList_Cooldowns()
				-- print("Cooldowns")
				if useCDs() and getDistance(units.dyn5) < 5 then

				end -- End Cooldown Usage Check
			end -- End Action List - Cooldowns
		-- Action List - Stealth Cooldowns
			local function actionList_StealthCooldowns()
				if useCDs() and getDistance(units.dyn5) < 5 then
				-- print("Stealth Cooldowns")
			-- Shadow Dance
					-- shadow_dance,if=charges>=3
					if charges.shadowDance >= 3 then
						if cast.shadowDance() then return end
					end
			-- Vanish
					-- vanish
					if cast.vanish() then vanishTime = GetTime(); return end
			-- Shadow Dance
					-- shadow_dance,if=charges>=2
					if charges.shadowDance >= 2 then
						if cast.shadowDance() then return end
					end
			-- Shadowmeld
					-- pool_resource,for_next=1,extra_amount=40
					-- shadowmeld,if=energy>=40
					if power < 40 then
						return true
					else
						if cast.shadowmeld() then vanishTime = GetTime(); return end
					end
			-- Shadow Dance
					-- shadow_dance
					if cast.shadowDance() then return end
				end
			end
		-- Action List - Finishers
			local function actionList_Finishers()
				-- print("Finishers")
			-- Enveloping Shadows
				-- enveloping_shadows,if=buff.enveloping_shadows.remains<target.time_to_die&buff.enveloping_shadows.remains<=combo_points*1.8
			-- Death from Above
				-- death_from_above,if=spell_targets.death_from_above>=10
			-- Night Blade
				-- nightblade,target_if=max:target.time_to_die,if=target.time_to_die>10&refreshable
				if ttd(units.dyn5) > 10 and debuff.refresh.nightblade then
					if cast.nightblade() then return end
				end
			-- Death from Above
				-- death_from_above
			-- Eviscerate
				-- eviscerate
				if cast.eviscerate() then return end
			end -- End Action List - Finishers
		-- Action List - Stealthed
			local function actionList_Stealthed()
				-- print("Stealth")
			-- Symbols of Death
				-- symbols_of_death,if=buff.symbols_of_death.remains<target.time_to_die-4&buff.symbols_of_death.remains<=buff.symbols_of_death.duration*0.3&buff.shadowmeld.down
				if buff.remain.symbolsOfDeath < ttd(units.dyn5) - 4 and buff.remain.symbolsOfDeath <= buff.duration.symbolsOfDeath * 0.3 and not buff.shadowmeld then
					if cast.symbolsOfDeath() then return end
				end
			-- Finisher
				-- call_action_list,name=finish,if=combo_points>=5
				if combo >= 5 then
					if actionList_Finishers() then return end
				end
			-- Shuriken Storm
				-- shuriken_storm,if=(combo_points.deficit>=3&spell_targets.shuriken_storm>=3)|buff.the_dreadlords_deceit.stack>=29
			-- Shadowstrike
				-- shadowstrike
				if cast.shadowstrike() then return end
			end
		-- Action List - Generators
			local function actionList_Generators()
				-- print("Generator")
			-- Shuriken Storm
				-- shuriken_storm,if=spell_targets.shuriken_storm>=2
			-- Backstab / Gloomblade
				-- gloomblade
				-- backstab
				if cast.backstab() then return end
			end -- End Action List - Generators
		-- Action List - PreCombat
			local function actionList_PreCombat()
				-- print("PreCombat")
			-- Stealth
				-- stealth
				if isChecked("Stealth") then
					if getOptionValue("Stealth") == 1 then
						if cast.stealth() then return end
					end
				end
			end -- End Action List - PreCombat
		-- Action List - Opener
			local function actionList_Opener()
				-- print("Opener")
			-- Shadowstep
                if isChecked("Shadowstep") and isValidUnit("target") then
                    if cast.shadowstep("target") then return end 
                end
                if isValidUnit("target") and getDistance("target") < 15 and mode.pickPocket ~= 2 then
            -- Stealthed
					-- run_action_list,name=stealthed,if=stealthed|buff.shadowmeld.up
					if buff.stealth or buff.shadowmeld then
						if actionList_Stealthed() then return end
					end			
			-- Start Attack
                	-- auto_attack
                	if not buff.stealth and getDistance("target") < 5 then
                    	StartAttack()
                    end
                end
			end -- End Action List - Opener
	---------------------
	--- Begin Profile ---
	---------------------
		--Profile Stop | Pause
			if not inCombat and not hastar and profileStop==true then
				profileStop = false
			elseif (inCombat and profileStop == true) or pause() or mode.rotation==4 then
				return true
			else
	-----------------------
	--- Extras Rotation ---
	-----------------------
				if actionList_Extras() then return end
	--------------------------
	--- Defensive Rotation ---
	--------------------------
				if actionList_Defensive() then return end
	------------------------------
	--- Out of Combat Rotation ---
	------------------------------
				if actionList_PreCombat() then return end
	----------------------------
	--- Out of Combat Opener ---
	----------------------------
				if actionList_Opener() then return end
	--------------------------
	--- In Combat Rotation ---
	--------------------------
				if inCombat and mode.pickPocket ~= 2 and isValidUnit(units.dyn5) and getDistance(units.dyn5) < 5 then
	------------------------------
	--- In Combat - Interrupts ---
	------------------------------
					if actionList_Interrupts() then return end
	-----------------------------
	--- In Combat - Cooldowns ---
	-----------------------------
					-- if actionList_Cooldowns() then return end
	----------------------------------
	--- In Combat - Begin Rotation ---
	----------------------------------
			-- Shadowstep
	                if isChecked("Shadowstep") then
	                    if cast.shadowstep("target") then return end 
	                end
			-- Nightblade
					-- nightblade,if=set_bonus.tier18_4pc&refreshable&time<5
			-- Cooldowns
					-- call_action_list,name=cds
					if actionList_Cooldowns() then return end
			-- Stealthed
					-- run_action_list,name=stealthed,if=stealthed|buff.shadowmeld.up
					if buff.stealth or buff.shadowmeld or buff.shadowDance then
						if actionList_Stealthed() then return end
					end
					if not buff.steath and not buff.vanish and not buff.shadowmeld and GetTime() > vanishTime + 2 then
			-- Shuriken Toss
						if getDistance(units.dyn30) > 5 and hasThreat(units.dyn30) then
							if cast.shurikenToss() then return end
						end
			-- Finishers
						-- run_action_list,name=finisher,if=combo_points>=5
						if combo >= 5 then
							if actionList_Finishers() then return end
						end
			-- Stealth Cooldowns
						-- call_action_list,name=stealth_cds,if=combo_points.deficit>=2+talent.premeditation.enabled&(energy.deficit<=20|(energy.deficit<=45&talent.master_of_shadows.enabled)|(cooldown.shadowmeld.up&!cooldown.vanish.up&cooldown.shadow_dance.charges<=1))
						if comboDeficit >= 2 + premed and (powerDeficit <= 20 or (powerDeficit <= 45 and talent.masterOfShadows) or (cd.shadowmeld == 0 and cd.vanish ~= 0 and charges.shadowDance <= 1)) then
							if actionList_StealthCooldowns() then return end
						end
			-- Generators
						-- call_action_list,name=build,if=energy.deficit<=20|(energy.deficit<=45&talent.master_of_shadows.enabled)
						if powerDeficit <= 20 or (powerDeficit <= 45 and talent.masterOfShadows) then
							if actionList_Generators() then return end
						end
					end
				end -- End In Combat
			end -- End Profile
	    end -- Timer
	end -- runRotation
	tinsert(cSubtlety.rotations, {
        name = rotationName,
        toggles = createToggles,
        options = createOptions,
        run = runRotation,
    })
end -- End Class Check