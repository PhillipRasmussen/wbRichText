<cfsetting enablecfoutputonly="true">
<!--- @@displayname: Image Description Cell --->
<cfquery datasource="#application.dsn#" name="q">
	SELECT objectid FROM dmHTML
	WHERE body like '%#replace(stobj.objectid,'-','%2D','all')#%'
</cfquery>	
<cfoutput>
    #stObj.title#
    <cfif len(stObj.alt)>
        <br><em>#stObj.alt#</em>
    </cfif>
	<cfif q.recordCount>
		<br>Currently being used in page.
	</cfif>
</cfoutput>

<cfsetting enablecfoutputonly="false">