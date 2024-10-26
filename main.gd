extends Node

func intialize_networking():
	# By default, these expressions are interchangeable.
	multiplayer # Get the MultiplayerAPI object configured for this node.
	get_tree().get_multiplayer() # Get the default MultiplayerAPI object.
	
	# Create client.
	var peer = ENetMultiplayerPeer.new()
	peer.create_client(IP_ADDRESS, PORT)
	multiplayer.multiplayer_peer = peer

	# Create server.
	var peer = ENetMultiplayerPeer.new()
	peer.create_server(PORT, MAX_CLIENTS)
	multiplayer.multiplayer_peer = peer
