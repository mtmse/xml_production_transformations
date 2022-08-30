declare default element namespace "http://www.w3.org/1999/xhtml";
declare namespace epub = "http://www.idpf.org/2007/ops";
declare namespace math = "http://www.w3.org/1998/Math/MathML";

for $math in //math:math
  let $asciimathsource := $math/@alttext
  return
    if ($math/@display="inline")
      then
	replace node $math with <span class="asciimath">{'`' || $asciimathsource || '`'}</span>
      else
	replace node $math with <p><span class="asciimath">{'`' || $asciimathsource || '`'}</span></p>