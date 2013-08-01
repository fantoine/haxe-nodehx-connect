package nodehx.connect;

import nodehx.Error;
import nodehx.http.IncomingMessage;
import nodehx.http.ServerResponse;

extern class ConnectModule implements nodehx.Node.NodeModule<"connect", "events,http,net", ""> implements Dynamic {
	/**
	 * Framework version.
	 */
	public var version(default, never) : String;
	
	/**
	 * Auto-load middleware getters.
	 */
	public var middleware(default, never) : Dynamic;
	
	
	/**
	 * Create a new connect server.
	 */
	public function createServer(?requestListener : IncomingMessage -> ServerResponse -> (?Error -> Void) -> Void) : App;
}