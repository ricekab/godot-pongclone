# godot-pongclone

A personal project to try out game development in Godot 3.4.x .

## Remarks

### Signalling

Signals set via the editor are stored on the scene (tscn file). Not sure if I'm
a fan of this for a larger project. Would probably prefer explicit signal connecting
in relevant object scripts.

Similar to Qt setups, maybe just have a "_connect_signals()" function that does all
connections, called from "_ready()"?