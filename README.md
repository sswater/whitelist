## White List
Add remote IP into white list using `iptables`.

### How
Using an `iptables` command:

	iptables -I INPUT -s X.X.X.X/32 -j ACCEPT
		
So, this webapp must run with `root` privilege.

### Usage
1. Block any incoming NEW connect:

		iptables -A INPUT -t tcp -m state --state NEW -j REJECT

2. Allow localhost connect:

		iptables -I INPUT -s 127.0.0.1/32 -j ACCEPT
		
3. Allow web visit from any IP:

		iptables -I INPUT -t tcp --dport 8080 -j ACCEPT