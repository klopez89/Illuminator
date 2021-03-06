on run argv

tell application "iOS Simulator" to launch

set inTime to current date
repeat
    tell application "System Events"
        if "iOS Simulator" is in (get name of processes) then exit repeat
    end tell
    if (current date) - inTime is greater than 10 then exit repeat
    delay 0.2
end repeat

tell application "iOS Simulator" to activate

set inTime to current date
repeat
    tell application "System Events"
        if visible of process "iOS Simulator" is true then exit repeat
    end tell
    if (current date) - inTime is greater than 10 then exit repeat
    delay 0.2
end repeat

set wantChecked to ("0" is not (item 1 of argv))

tell application "System Events"
    tell process "iOS Simulator"
        tell menu bar 1
            tell menu bar item "Hardware"
                tell menu 1
                    tell menu item "Keyboard"
                        tell menu 1
                            set isChecked to ("✓" is (value of attribute "AXMenuItemMarkChar" of menu item "Connect Hardware Keyboard") as string)
                            -- display dialog "checking: "  & wantChecked & " vs " & isChecked
							if wantChecked is not isChecked then
								click menu item "Connect Hardware Keyboard"
							end if
						end tell
					end tell
				end tell
			end tell
		end tell
	end tell
end tell

end run