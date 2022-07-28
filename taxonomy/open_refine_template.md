# Open Refine Template for Taxonomy Creation


## Template

#### Prefix

```
<?xml version="1.0" encoding="UTF-8"?>
<?xml-model href="http://www.tei-c.org/release/xml/tei/custom/schema/relaxng/tei_all.rng" type="application/xml" schematypens="http://relaxng.org/ns/structure/1.0"?>
<?xml-model href="http://www.tei-c.org/release/xml/tei/custom/schema/relaxng/tei_all.rng" type="application/xml"
	schematypens="http://purl.oclc.org/dsdl/schematron"?>
<TEI xmlns="http://www.tei-c.org/ns/1.0">
    <teiHeader>
        <fileDesc>
            <titleStmt>
                <title>Maria Edgeworth Letters Project Taxonomy</title>
                <sponsor>Wake Forest University, University of Tennessee, Xavier University, Texas
                    A&amp;M University</sponsor>
                <respStmt>
                    <resp>Contributors include:</resp>
                    <persName>Meredith Hale</persName>
                    <persName>Jessica Richard</persName>
                    <persName>Hilary Havens</persName>
                    <persName>Robin Runia</persName>
                    <persName>Susan Egenolf</persName>
                    <persName>Eliza Wilcox</persName>
                    <persName>Jamie Kramer</persName>
                </respStmt>
            </titleStmt>
            <publicationStmt>
                <authority>Maria Edgeworth Letters Project</authority>
                <availability>
                    <licence>Distributed under a Creative Commons Attribution-ShareAlike 3.0 Unported License</licence>
                </availability>
            </publicationStmt>
            <sourceDesc>
                <p>Taxonomy terms and identifiers are derived from the Virtal International Authority File (VIAF), the Library of Congress Name Authority File
                (LCNAF), Wikidata, and the Getty's Thesaurus of Geographic Names (TGN).</p>
            </sourceDesc>
        </fileDesc>
        <encodingDesc>
            <classDecl>
            <taxonomy xml:id="people">
                    <bibl>People</bibl>
                    <category>
                
  
```
####Body

```  
{{if(isBlank(cells['ID'].value), '', '<catDesc xml:id="' + cells['ID'].value + '">' + cells['Term'].value + if(isBlank(cells['LoC_URI'].value), '', '<ref type="naf">' + cells['LoC_URI'].value +'</ref>') + if(isBlank(cells['VIAF URI'].value), '', '<ref type="viaf">' + cells['VIAF URI'].value +'</ref>') + '</catDesc>')}}

```

#### Suffix

```
                  </category>
               </taxonomy> 
            </classDecl>
        </encodingDesc>
    </teiHeader>
    <text>
        <body>
            <p>This is a taxonomy that defines people, places, works, and contributing organizations for the Maria Edgeworth Letters project.</p>
        </body>
    </text>
</TEI>

```