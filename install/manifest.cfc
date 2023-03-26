<!--- @@Copyright: Daemon Pty Limited 2002-2009, http://www.daemon.com.au --->
<!--- @@License:  --->
<!--- @@displayname: Webolution Rich Text Editor installation manifest --->
<!--- @@Description: Installation manifest for the Webolution Rich Text Editor plugin --->
<cfcomponent extends="farcry.core.webtop.install.manifest" name="manifest">

<cfset this.name = "Webolution Rich Text Editor v1.0" />
<cfset this.description = "TinyMCE" />
<cfset this.lRequiredPlugins = "" />
<cfset this.version = "1.0" />
<cfset addSupportedCore(majorVersion="7", minorVersion="0", patchVersion="0") />

</cfcomponent>