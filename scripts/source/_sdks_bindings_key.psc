Scriptname _SDKS_bindings_key extends ObjectReference  

_SDQS_functions Property funct  Auto

FormList Property _SDFLP_sex_items  Auto
FormList Property _SDFLP_punish_items  Auto
Spell Property _SDSP_freedom  Auto  

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	If ( akOldContainer == Game.GetPlayer() )
		Self.DeleteWhenAble()
	EndIf
	
	If (  akNewContainer == Game.GetPlayer() )
		Actor kContainer = akNewContainer as Actor
		funct.removeItemsInList( kContainer, _SDFLP_sex_items )
		funct.removeItemsInList( kContainer, _SDFLP_punish_items )
		_SDSP_freedom.RemoteCast( akNewContainer, kContainer, kContainer )
		Game.GetPlayer().RemoveItem(Self, Game.GetPlayer().GetItemCount( Self ))
	EndIf	
EndEvent
