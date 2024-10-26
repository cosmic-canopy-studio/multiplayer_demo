extends Node

# Created based on https://docs.godotengine.org/en/stable/tutorials/networking/high_level_multiplayer.html
func _ready():
	if multiplayer.is_server():
		print_once_per_client.rpc()


@rpc
func print_once_per_client():
	print("I will be printed to the console once per each connected client.")


# Helpers
func intialize_networking():
	# By default, these expressions are interchangeable.
	# get_tree().get_multiplayer() # Get the default MultiplayerAPI object.
	# multiplayer # Get the MultiplayerAPI object configured for this node.
	const PORT: int         = 9980
	const MAX_CLIENTS: int  = 12
	const SERVER_IP: String = "127.0.0.1"

	const is_server: bool = multiplayer.is_server()
	if (is_server):
		initialize_server(PORT, MAX_CLIENTS);
	else:
		initialize_client(SERVER_IP, PORT)


func initialize_server(port, max_clients):
	# Create server.
	var peer = ENetMultiplayerPeer.new()
	peer.create_server(port, max_clients)
	multiplayer.multiplayer_peer = peer


func initialize_client(ip_address, port):
	# Create client.
	var peer = ENetMultiplayerPeer.new()
	peer.create_client(ip_address, port)
	multiplayer.multiplayer_peer = peer


func terminate_connection():
	multiplayer.multiplayer_peer = null


func get_peer_id():
	# Every peer is assigned a unique ID. The server's ID is always 1, and clients are assigned a random positive integer.
	multiplayer.get_unique_id()


# Signals
func on_peer_connected():
# peer_connected(id: int) This signal is emitted with the newly connected peer's ID on each other peer, and on the new peer multiple times, once with each other peer's ID.


func on_peer_disconnected():
# peer_disconnected(id: int) This signal is emitted on every remaining peer when one disconnects.

#The rest are only emitted on clients:
#connected_to_server()
#connection_failed()
#server_disconnected()
	
