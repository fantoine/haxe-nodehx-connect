/**
 * ...
 * @author Fabien Antoine
 * @copy Fabien Antoine (fantoine@intuitiv.fr)
 */

package nodehx.connect;

import nodehx.Error;
import nodehx.events.EventEmitter;
import nodehx.http.Server;
import nodehx.net.Socket;

extern class App extends EventEmitter {
	public var route : String;
	
	public var stack : Array<Dynamic>;
	
	/**
	 * Utilize the given middleware `handle` to the given `route`,
	 * defaulting to _/_. This "route" is the mount-point for the
	 * middleware, when given a value other than _/_ the middleware
	 * is only effective when that segment is present in the request's
	 * pathname.
	 *
	 * For example if we were to mount a function at _/admin_, it would
	 * be invoked on _/admin_, and _/admin/settings_, however it would
	 * not be invoked for _/_, or _/posts_.
	 *
	 * Examples:
	 *
	 *      var app = connect();
	 *      app.use(connect.favicon());
	 *      app.use(connect.logger());
	 *      app.use(connect.static(__dirname + '/public'));
	 *
	 * If we wanted to prefix static files with _/public_, we could
	 * "mount" the `static()` middleware:
	 *
	 *      app.use('/public', connect.static(__dirname + '/public'));
	 *
	 * This api is chainable, so the following is valid:
	 *
	 *      connect()
	 *        .use(connect.favicon())
	 *        .use(connect.logger())
	 *        .use(connect.static(__dirname + '/public'))
	 *        .listen(3000);
	 *
	 * @param {String|Function|Server} route, callback or server
	 * @param {Function|Server} callback or server
	 */
	@:overload(function(route : String, listener : Error -> ConnectIncomingMessage -> ConnectServerResponse -> (?Error -> Void) -> Void) : App {})
	@:overload(function(route : String, listener : ConnectIncomingMessage -> ConnectServerResponse -> (?Error -> Void) -> Void) : App {})
	@:overload(function(route : String, listener : ConnectIncomingMessage -> ConnectServerResponse -> Void) : App {})
	@:overload(function(listener : Error -> ConnectIncomingMessage -> ConnectServerResponse -> (?Error -> Void) -> Void) : App {})
	@:overload(function(listener : ConnectIncomingMessage -> ConnectServerResponse -> (?Error -> Void) -> Void) : App {})
	@:overload(function(listener : ConnectIncomingMessage -> ConnectServerResponse -> Void) : App {})
	@:overload(function(server : Server) : App {})
	public function use(route : String) : App;
	
	/**
	 * Listen for connections.
	 *
	 * This method takes the same arguments
	 * as node's `http.Server#listen()`.
	 *
	 * HTTP and HTTPS:
	 *
	 * If you run your application both as HTTP
	 * and HTTPS you may wrap them individually,
	 * since your Connect "server" is really just
	 * a JavaScript `Function`.
	 *
	 *      var connect = require('connect')
	 *        , http = require('http')
	 *        , https = require('https');
	 *
	 *      var app = connect();
	 *
	 *      http.createServer(app).listen(80);
	 *      https.createServer(options, app).listen(443);
	 */
	@:overload(function(path : String, ?callback : Void -> Void) : Server {})
	@:overload(function(handle : Server, ?callback : Void -> Void) : Server {})
	@:overload(function(handle : Socket, ?callback : Void -> Void) : Server {})
	public function listen(port : Int, ?hostname : String, ?backlog : Int, ?callback : Void -> Void) : Server;
}