<cfsetting enablecfoutputonly="true">
<!--- @@displayname: Images Webtop Body --->

<cfimport taglib="/farcry/core/tags/formtools" prefix="ft">

<ft:objectadmin
				Title="AdHock Images (dragged into richtext editor)"
	typename="wbRichTextImage"
	lCustomColumns="Thumbnail:cellThumbnail,Title / Alt:cellDescription"
	columnList="datetimelastupdated"
	sortableColumns="title,datetimelastupdated"
	lFilterFields="title,alt"
	bPreviewCol="false"
	sqlorderby="datetimelastupdated DESC" />

<cfsetting enablecfoutputonly="false">