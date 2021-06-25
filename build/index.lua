local function deleteDirectory(dir)
	local files = System.listDirectory(dir)
	for i, file in pairs(files) do
		if file.directory then
			deleteDirectory(dir .. "/" .. file.name)
		else
			System.deleteFile(dir .. "/" .. file.name)
		end
	end
	System.deleteDirectory(dir)
end

-- Create a new color
white = Color.new(255,255,255,255) 

-- Main loop
while true do
	
	-- Draw a string on the screen
	Graphics.initBlend()
	Screen.clear()
	Graphics.debugPrint(5, 5, "FastReset by SilicaAndPina", white)
    Graphics.debugPrint(5, 25, "CROSS: Enable FastReset 1.0 (Skip intro video)", white)
    Graphics.debugPrint(5, 45, "CIRCLE: Disable FastReset 1.0 (Dont skip intro video)", white)
    Graphics.debugPrint(5, 65, "SQUARE: Enable FastReset 2.0 (Skip initalsetup.self)", white)
    Graphics.debugPrint(5, 85, "TRIANGLE: Disable FastReset 2.0 (Dont skip  initalsetup.self)", white)
	Graphics.termBlend()
	
	-- Update screen (For double buffering)
	Screen.flip()
	
	-- Check controls for exiting
	if Controls.check(Controls.read(), SCE_CTRL_CROSS) then
		System.extractZIP("app0:/patch.zip","ux0:/patch")
        System.exit()
	end
    if Controls.check(Controls.read(), SCE_CTRL_CIRCLE) then
		deleteDirectory("ux0:/patch/NPXS10007")
        System.exit()
	end
	if Controls.check(Controls.read(), SCE_CTRL_SQUARE) then
		System.extractZIP("app0:/regpatch.zip","os0:/kd")
        System.exit()
    end
	if Controls.check(Controls.read(), SCE_CTRL_TRIANGLE) then
		System.extractZIP("app0:/regorig.zip","os0:/kd")
        System.exit()
    end
    
	
end