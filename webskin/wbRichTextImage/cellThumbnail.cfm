<cfsetting enablecfoutputonly="true">
<!--- @@Copyright: Daemon Pty Limited 2002-2013, http://www.daemon.com.au --->
<!--- @@displayname: grid renderer for thumbnail --->

<cfoutput>
<img src="#getFileLocation(stobject=stobj, fieldname="sourceImage").path#" style="margin-right: 10px;max-width:150px;">
</cfoutput>

<cfsetting enablecfoutputonly="false">