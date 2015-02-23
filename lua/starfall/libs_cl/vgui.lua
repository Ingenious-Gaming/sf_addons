local vgui_library, _ = SF.Libraries.Register( "vgui" )

local pwrap, punwrap = SF.Panel.wrap, SF.Panel.unwrap
local plyCount = SF.Panel.plyCount

function vgui_library.create( classname, parent, name )
    SF.CheckType( classname, "string" )
    if parent then SF.CheckType( parent, SF.Types[ "Panel" ] ) end
    if name then SF.CheckType( name, "string" ) end

	local instance = SF.instance
	local paneldata = instance.data.panels

	local panel = vgui.Create( classname, punwrap( parent ), name )

	if panel and panel:IsValid() then
		panel = pwrap( panel )
		paneldata.panels[ panel ] = true
		paneldata.count = paneldata.count + 1

		plyCount[ instance.player ] = plyCount[ instance.player ] + 1

		return panel
	end
end