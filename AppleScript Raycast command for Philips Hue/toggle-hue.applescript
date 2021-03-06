#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Toggle Hue
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🤖

# Documentation:
# @raycast.description Philips Hue toggle lights
# @raycast.author Rediwed

set lights to {4, 5, 7, 8, 9, 10, 11, 13, 14, 15, 16, 17} as list -- List of lights you want to toggle

Change(lights) -- initates script

on GetBridge()
	return "[enter bridge IP here]" -- The Bridge IP
end GetBridge

on GetApi()
	return "[enter API key here]" -- Your ApiKey
end GetApi

on State(x, BridgeAddress, apiKey)
	set LampState to do shell script "curl --request GET http://" & BridgeAddress & "/api/" & apiKey & "/lights/" & x & "/"
	set the_String to LampState
	
	try
		set oldDelims to AppleScript's text item delimiters
		set AppleScript's text item delimiters to {":", ","}
		-- do script steps here
		set these_items to the text items of the_String
		set AppleScript's text item delimiters to oldDelims
	on error
		set AppleScript's text item delimiters to oldDelims
	end try
	
	set Lamppower to (item 3 of these_items)
	return Lamppower
end State

on GetOn()
	set ret to the quoted form of "{\"on\": true,\"hue\": 0, \"sat\": 0,\"bri\": 254}"
	return ret
end GetOn

on GetOff()
	set ret to the quoted form of "{\"on\": false}"
	return ret
end GetOff

on Change(x)
	repeat with x in x
		set BridgeAddress to GetBridge()
		set apiKey to GetApi()
		set Etat to State(x, BridgeAddress, apiKey)
		
		if Etat = "true" then
			turnOff(x)
		else
			turnOn(x)
		end if
	end repeat
end Change

on turnOff(x)
	set BridgeAddress to GetBridge()
	set apiKey to GetApi()
	set action to GetOff()
	
	do shell script "curl --request PUT --data " & action & " http://" & BridgeAddress & "/api/" & apiKey & "/lights/" & x & "/state/"
	log "Lights Turned off"
end turnOff

on turnOn(x)
	set BridgeAddress to GetBridge()
	set apiKey to GetApi()
	set action to GetOn()
	
	do shell script "curl --request PUT --data " & action & " http://" & BridgeAddress & "/api/" & apiKey & "/lights/" & x & "/state/"
	log "Lights Turned on"
end turnOn
