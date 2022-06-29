# godot-pongclone

A personal project to try out game development in Godot 3.4.x .

## Note on gitignore

Songs (and maybe sounds?) may not be open source licensed and are thus git ignored.

## Remarks

### Signalling

Signals set via the editor are stored on the scene (tscn file). Not sure if I'm
a fan of this for a larger project. Would probably prefer explicit signal connecting
in relevant object scripts.

Similar to Qt setups, maybe just have a "_connect_signals()" function that does all
connections, called from "_ready()"?

### Audio / Import settings

Looping is configured **on the resource**. This needs to be changed on the import tab
with the resource selected.