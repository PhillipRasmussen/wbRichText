<cfsetting enablecfoutputonly="yes">

<!---------------------------------
 IMPORT TAG LIBRARIES
 --------------------------------->

<cfimport taglib="/farcry/core/tags/webskin" prefix="skin">

<skin:registerJS id="tinymce" core="true" bCombine="false"
							baseHREF="/farcry/plugins/wbRichText/www/tiny_mce"
							lFiles="tinymce.min.js" />

<cfsetting enablecfoutputonly="no">