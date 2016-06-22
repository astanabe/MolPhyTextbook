del molphytextbook.ja.bib
copy molphytextbook.bib molphytextbook.ja.bib
platex --kanji=utf8 molphytextbook.ja
pbibtex --kanji=utf8 molphytextbook.ja
platex --kanji=utf8 molphytextbook.ja
platex --kanji=utf8 molphytextbook.ja
dvipdfmx molphytextbook.ja
perl convert4latexml.pl < molphytextbook.ja.tex > molphytextbook.ja.temp.tex
call latexml --xml --nocomments --inputencoding=utf8 --destination=molphytextbook.ja.xml molphytextbook.ja.temp.tex
del molphytextbook.ja.temp.tex
perl convertxml2xml.pl < molphytextbook.ja.xml > molphytextbook.ja.temp.xml
del molphytextbook.ja.xml
rename molphytextbook.ja.temp.xml molphytextbook.ja.xml
call latexmlpost --format=html5 --crossref --index --mathimages --graphicimages --destination=molphytextbook.ja.html molphytextbook.ja.xml
perl converthtml2html.ja.pl < molphytextbook.ja.html > molphytextbook.ja.temp.html
del molphytextbook.ja.html
rename molphytextbook.ja.temp.html molphytextbook.ja.html
perl convertmathml2png.pl < molphytextbook.ja.html > molphytextbook.ja.temp.html
del molphytextbook.ja.html
rename molphytextbook.ja.temp.html molphytextbook.ja.html
perl -i.bak -npe "s/<dc:date>.+<\/dc:date>/<dc:date>%date:~0,4%-%date:~5,2%-%date:~8,2%<\/dc:date>/" molphytextbook.ja.opf
ebook-convert molphytextbook.ja.html molphytextbook.ja.epub --max-toc-links=0 --toc-threshold=1 --level1-toc=//h:h2 --level2-toc=//h:h3 --level3-toc=//h:h4 --read-metadata-from-opf=molphytextbook.ja.opf --cover=molphytextbook.ja.png --preserve-cover-aspect-ratio
kindlegen molphytextbook.ja.epub
