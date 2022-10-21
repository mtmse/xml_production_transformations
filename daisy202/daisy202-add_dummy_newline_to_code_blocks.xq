(: This script inserts dummy newlines at the start of
each block code element in DAISY 2.02 content files.

It aims to fix the problem of erratic whitespace 
transformations in DAISY 2.02 content files with
code in the "regeneration" stage in MTM's production 
system, where the XML/HTML parser is reindenting the 
element structures, breaking whitespace in the first 
line of code.

Note, currently tailored for content files using 
<pre><code><span class="sentence">[...]</code></pre> 
markup, but could be developed to include other 
variants as well, e.g. <p><span class="inline-code">
<a>[...]</p>.
:)

declare default element namespace "http://www.w3.org/1999/xhtml";

for $codeblock in //code[parent::pre]
  let $firstchild := $codeblock/*[1]
  let $dummynewline := "&#10;"
  return insert node $dummynewline as first into $firstchild