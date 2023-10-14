paste_postprocess: function (plugin, args) {
    // Find all images in the pasted content
    var images = args.node.querySelectorAll('img');
    // Set the alt tag of each image to the original file name
    for (var i = 0; i < images.length; i++) {
      var image = images[i];
      //var filename = args.blobInfo[i].filename;
     image.setAttribute('alt', '');
    }
  },


plugins : "imagetools,paste,bootstrap4grid,visualblocks,farcrycontenttemplates,layer,table,hr,image_farcry,link_farcry,insertdatetime,media,searchreplace,contextmenu,paste,directionality,fullscreen,visualchars,nonbreaking,anchor,charmap,code,textcolor,lists advlist,noneditable",
				extended_valid_elements: "code,colgroup,col,thead,tfoot,tbody,abbr,blockquote,cite,button,textarea[name|class|cols|rows],script[type],img[usemap|contenteditable|style|class|src|border=0|alt|title|hspace|vspace|width|height|align|onmouseover|onmouseout|name|rel],i[class],figure[contenteditable]",
				menubar : false,
				toolbar : "undo redo | cut copy paste pastetext | visualblocks  styleselect | bold italic underline hr | alignleft aligncenter alignright alignjustify | bullist numlist link anchor |  image,media, table farcryuploadcontent farcrycontenttemplates bootstrap4grid | code | fullscreen",
				remove_linebreaks : false,

				/*forced_root_block : 'p',*/
				relative_urls : false,
				entity_encoding : 'raw',

link_class_list: [
    {title: 'None', value: ''},
    {title: 'External Link', value: 'ext_link'},
    {title: 'Internal Support Link', value: 'int_sup_link'},
    {title: 'Internal Marketing Link', value: 'int_mark_link'},
    {title: 'Other Internal Link', value: 'int_other_link'}
  ],
style_formats: [

     

    { title: 'Headers', items: [
      { title: 'h1', block: 'h1' },
      { title: 'h2', block: 'h2' },
      { title: 'h3', block: 'h3' },
      { title: 'h4', block: 'h4' },
      { title: 'h5', block: 'h5' },
      { title: 'h6', block: 'h6' }
    ] },

    { title: 'Blocks', items: [
      { title: 'p', block: 'p' },
      { title: 'div', block: 'div' },
      { title: 'pre', block: 'pre' },
      { title: 'clearfix', block: 'div',classes:'clearfix' }

    ] },

    { title: 'Containers', items: [
      { title: 'section', block: 'section', wrapper: true, merge_siblings: false },
      { title: 'article', block: 'article', wrapper: true, merge_siblings: false },
      { title: 'blockquote', block: 'blockquote', wrapper: true },
      { title: 'hgroup', block: 'hgroup', wrapper: true },
      { title: 'aside', block: 'aside', wrapper: true },
      { title: 'figure', block: 'figure', wrapper: true }
    ] },
{ title: 'Buttons', items: [
     { title: 'Primary',  selector: 'a',classes: 'btn btn-primary'},
     { title: 'Primary large',  selector: 'a',classes: 'btn btn-primary btn-lg'},
     { title: 'Secondary',  selector: 'a',classes: 'btn btn-secondary'},
     { title: 'Secondary large',  selector: 'a',classes: 'btn btn-secondary btn-lg'}
    ] }

  ]