# HAProxy
[![N|HAProxy](https://cldup.com/dTxpPi9lDf.thumb.png)](https://nodesource.com/products/nsolid)

[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger)

## Algorithims that allow you to make the backend logic
---
The huge determinant that allow you to the difference between frontend logic work from backend.
Frontend anything infront of the HAProxy:

- Timeout : Kill all the TCP connection that allow communication between the client and the server if client is idle.
- Bind : Connection port that the client connect to.
- ACL : Blocking some client connection.

Backend anything behind the HAProxy:

- Timeout Connect : How long do you want HAProxy to wait for the connection.
- Timeout Sever : How long do you want to have a connection between the database and the request
- Balance (roundrobin, leastconn, source) :
    - `roundrobin -> Jump between servers`
    - `leastconn -> Type of connection to connect to a specific server`

Multiple Frontends or Multiple Backends [Varnish(http unencrypted)] 
Frontend  bind to one or more ports
Two frontends:

- Frontend http - binds 80 (forwad to https backend) (Not encrypted)
- Frontend https - binds 443 (Frontend is encrypted)

## HAProxy modes (TCP and HTTP)
Modes of protocals to use.
Which layer layer they work on Layer 4 (tcp) Layer 7 (http)
- Layer 7 looks at the data (hey your proxy is looking at your data)
- Layer 4 uses something called an ssl pass through

## ACL (Access Control List)
Applies on both frontend and backend
Where do you want some of the paths to be directed to
Eg block any request to /admin (needs http mode)
Reroute traffic to a different backend microservices

## TLS Termination vs TLS Passthrough
TLS (Transport layer Security) helps on how computers communicate over the network
An encryptng protocal for secure data transactions.
Released by Internet Engineering Task Force (IEFT)
Found on layer 4 in the OSI model Transport Level (data transaction)
HTTP was the initial tranaction protocal on the internet, but was unsafe until new and secured one started to be developed
Which include the SSL/TLS encryption. All of this kind of encryption is all the one you did as before with the ssh-keygen

What is a proxy just an intermidiary between the client and a server. As i would like to call it a broker in realife scenario
Benefits of a TLS proxy:

- Load Balancing
- Identity hiding
- Secure
- Traffic Filtering
- Bandwidth saving

Helps in securing all connection made and the data being transfered from the client to the sever.
One bottleneck is that the connection which was established between the client and the server is lost.
But still there is hope, we have two kind of TLS proxies based on how they participate in the process.

- PassThrough proxies which just passes through the encrypted data from the client end to the server end.
- Termination proxies interrupt the connection in the middle.

#### TLS Termination proxies
Its an active participant in the connection meaning it will terminate the connection between the server and the client.
Termination occurs since the proxy needs to read and analyze the traffic
Due to this an intermidiary breaks the tunnel between a client and the server into two parts.

- Offloading: Proxy-server connection is terminated. data from the client's side is forwarded as HTTP to a server
- Encryption: Client-Proxy connection is terminated. A http data from the client side is fowarded as HTTPS to a server
- Bridging: combination of the two types of connection.

##### Offloading
Proxy server recieves the encrypted data from the client's side and starts to decrypt it.
Data is analyzide and managed. Then sent to the proxy server
Encryption then starts in order to return it to the client side
Works is pretty efficient methods and allow lees load to be pushed to the server.
Proxy server needs to get the same CA as the one the server has.
All servers need to prove it is trusted in order to start a handshake( a TLS connection is established )

#### Encryption
Same as the offloading theory the only difference is that all the connection made between the server and the proxies is done through HTTPS protocal.
While on the client and the proxy its done through the HTTP protocal.

#### Bridge
A combination of the two connection.


#### TLS Passthrough Proxy
its passive all the encryption and decryption is done at the end-points.
Only used for loadbalancing purposes
Secure since Protocal defined is used all through out the connection and not connection is lost between the server and client.
Only bottleneck it's deem costly.


## How to configure HAProxy file
-----
- Using the round robbin algorithm
```cfg
frontend <anyName>
	bind <IP:Port> # most commonly used is *:80 listening to all the subnets available
	timeout client <secs> # time out for the server listening
	default_backend <nameOfBackEndserver> # how to connect the backend with the front end


backend <anyName>
	timeout connect <sec> # how long should the handshake wait to take place
	timeout server <sec> # how long you should wait for the connection to wait for.
	server <anyName> <IP:Port>
	server <anyName> <IP:Port>
	server <anyName> <IP:Port>
	server <anyName> <IP:Port>
```
- Use telnet to get instance of TLS connection each time we make a connection.

```cfg
frontend <anyName>
	bind <IP:Port> # most commonly used is *:80 listening to all the subnets available
	timeout client <secs> # time out for the server listening
	mode http # default is tcp
	default_backend <nameOfBackEndserver> # how to connect the backend with the front end


backend <anyName>
	timeout connect <sec> # how long should the handshake wait to take place
	timeout server <sec> # how long you should wait for the connection to wait for.
	mode http
	server <anyName> <IP:Port>
	server <anyName> <IP:Port>
	server <anyName> <IP:Port>
	server <anyName> <IP:Port>
```

- Now making use of multiple backends

```cfg
frontend <anyName>
	bind <IP:Port>
	timeout client <secs>
	mode http
	default_backend <nameOfBackEndserver>


backend <anyName>
	timeout connect <sec>
	timeout server <sec>
	mode http
	server <anyName> <IP:Port>
	server <anyName> <IP:Port>
	server <anyName> <IP:Port>
	server <anyName> <IP:Port>
