<!--- @@Copyright: Daemon Pty Limited 2002-2013, http://www.daemon.com.au --->
<!--- @@License:
    This file is part of FarCry.

    FarCry is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    FarCry is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with FarCry.  If not, see <http://www.gnu.org/licenses/>.
--->
<cfcomponent 
	extends="farcry.core.packages.types.types" 
	displayname="Rich Text Image" hint="Images created by droping into the rich text block."
	bObjectBroker="false"
	bBulkUpload="false"
	icon="fa-picture-o">
<!------------------------------------------------------------------------
type properties
------------------------------------------------------------------------->
<cfproperty 
	name="title" type="string" hint="Image title." required="no" default="" blabel="true" 
	ftSeq="2" ftFieldset="General Details" ftlabel="Image Title" ftValidation="required"
	ftBulkUploadEdit="true" />

<cfproperty 
	name="alt" type="string" dbprecision="1000" hint="Alternate text" required="no" default=""
	ftSeq="4" ftFieldset="General Details" ftlabel="Alternative Text"
	fttype="longchar" ftlimit="999"
	ftBulkUploadEdit="true" /> 

<!--- image file locations --->
<cfproperty 
	name="SourceImage" type="string" hint="The URL location of the uploaded image" required="No" default="" 
	ftSeq="22" ftFieldset="Image Files" ftlabel="Source Image" 
	ftType="Image" 
	ftCreateFromSourceOption="false" 
	ftAllowResize="false"
	ftDestination="/images/dmImage/SourceImage" 
	ftImageWidth="2048" 
	ftImageHeight="2048"
	ftAutoGenerateType="FitInside"
	ftbUploadOnly="true"
	ftBulkUploadTarget="true"
	ftHint="Upload your high quality source image here."  />


	
<cffunction name="delete" access="public" hint="Specific delete method for dmImage. Removes physical files from ther server." returntype="struct">
	<cfargument name="objectid" required="yes" type="UUID" hint="Object ID of the object being deleted">
	
	<cfset var stLocal = StructNew()>
	<!--- get object details --->
	<cfset var stObj = getData(arguments.objectid)>
	<cfset var stReturn = StructNew()>
	<cfset var relatedTable = "">
	<cfset var type	= '' />
	<cfset var prop	= '' />

	<cfset stReturn.bSuccess = true>
	<cfset stReturn.message = "">
		
	<cfset stLocal.errormessage = "">

	<cfset stLocal.relatedQty = 0 />
	
	<cfloop collection="#application.stcoapi#" item="type">
		<cfif NOT reFindNoCase("^config", type)>
			<cfloop collection="#application.stcoapi[type].stProps#" item="prop">
				<cfif application.stcoapi[type].stProps[prop].metadata.type EQ "array" AND structKeyExists(application.stcoapi[type].stProps[prop].metadata,"ftJoin") and listFindNoCase(application.stcoapi[type].stProps[prop].metadata.ftJoin, "dmimage")>
					<cfquery name="stLocal.qCheck" datasource="#application.dsn#">
					SELECT	parentId
					FROM	#type#_#prop#
					WHERE	data = '#arguments.objectid#'
					</cfquery>
					
					<cfif stLocal.qCheck.recordCount>
						<cfset stLocal.relatedQty = stLocal.relatedQty + stLocal.qCheck.recordCount />
					</cfif>
				<cfelseif application.stcoapi[type].stProps[prop].metadata.type EQ "uuid" AND structKeyExists(application.stcoapi[type].stProps[prop].metadata,"ftJoin") and listFindNoCase(application.stcoapi[type].stProps[prop].metadata.ftJoin, "dmimage")>
					<cfquery name="stLocal.qCheck" datasource="#application.dsn#">
					SELECT	objectid
					FROM	#type#
					WHERE	#prop# = '#arguments.objectid#'
					</cfquery>
					
					<cfif stLocal.qCheck.recordCount>
						<cfset stLocal.relatedQty = stLocal.relatedQty + stLocal.qCheck.recordCount />
					</cfif>			
				</cfif>
			</cfloop>
		</cfif>
	</cfloop>

	<cfif stLocal.relatedQty GTE 1>
		<cfset stReturn.bSuccess = false>
		<cfset stReturn.message = stReturn.message & "Sorry image [#stObj.label#] cannot be delete because it is associated to <strong>#stLocal.relatedQty#</strong> other item(s).<br />">
		<cfreturn stReturn>
	<cfelse>
		<cfreturn super.delete(argumentCollection=arguments) />
	</cfif>
</cffunction>







<cffunction name="BeforeSave" access="public" output="false" returntype="struct">
	<cfargument name="stProperties" required="true" type="struct">
	<cfargument name="stFields" required="true" type="struct">
	<cfargument name="stFormPost" required="false" type="struct">		
	
	<cfif not structkeyexists(arguments.stProperties,"title") or not len(arguments.stProperties.title) and structkeyexists(arguments.stProperties,"sourceImage")>
		<cfset arguments.stProperties.title = listfirst(listlast(urldecode(arguments.stProperties.sourceImage),"/"),".") />
	</cfif>
	
	<cfif structkeyexists(arguments.stProperties,"title")>
		<cfset arguments.stProperties.label = arguments.stProperties.title />
	</cfif>
	
	<cfreturn super.beforeSave(argumentCollection=arguments) />
</cffunction>


</cfcomponent>