extends AudioStreamPlayer

var songs = [
	# load dynamically (since gitignored)
	#preload("res://music/song01.ogg"),
	#preload("res://music/song02.ogg"),
	#preload("res://music/song03.ogg"),
]

var song_idx: int

func _ready():
	if not _load_ogg_files():
		return  # No music files found
	var RNG = RandomNumberGenerator.new()
	RNG.randomize()
	song_idx = RNG.randi_range(0, songs.size() - 1)
	self.stream = songs[song_idx]
	self.play()
	connect("finished", self, "next_song")

func _load_ogg_files():
	var dir = Directory.new()
	if not dir.dir_exists("res://music"):
		return false
	if dir.open("res://music") != OK:
		return false
	dir.list_dir_begin()
	var file_name = dir.get_next()
	while file_name != "":
		if not file_name.ends_with(".ogg"):
			pass
		#if dir.current_is_dir():
		#	pass  # don't recurse dirs, just skip
		else:
			var song_name = dir.get_current_dir() + "/" + file_name
			print(song_name)
			songs.append(load(song_name))
		file_name = dir.get_next()
	return true
	

func _process(delta):
	pass
	#print(self.get_playback_position())
	#print(self.stream.get_length())
	#print('---')

func next_song():
	song_idx = (song_idx + 1) % songs.size()
	self.stream = songs[song_idx]
	self.play()
