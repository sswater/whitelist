<%@
page import="java.io.*"%><%@
page language="java" contentType="text/plain; charset=UTF-8" pageEncoding="UTF-8"%><%

String ip = request.getHeader("X-Real-IP") != null ? request.getHeader("X-Real-IP") : request.getRemoteAddr();
String tables = getTables();

if(tables.indexOf(ip) >= 0) {
	out.println("Current ip: " + ip + " exists.");
}
else {
	Runtime.getRuntime().exec(new String[]{ "iptables", "-I", "INPUT", "-s", ip+"/32", "-j", "ACCEPT" });
	out.println("Current ip: " + ip + " added.");
}
%>
<%!
String getTables() throws Exception {
	Process p = Runtime.getRuntime().exec(new String[]{ "iptables", "-L", "-n" });
	BufferedReader in = new BufferedReader(new InputStreamReader(p.getInputStream()));
	StringBuffer sb = new StringBuffer();
	String line;
	while((line = in.readLine()) != null) {
		sb.append(line).append("\n");
	}
	return sb.toString();
}
%>
