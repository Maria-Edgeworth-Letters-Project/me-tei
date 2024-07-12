# OpenRefine Template for MELP Minimal Metadata Records

---

## Prefix

```
<?xml version="1.0" encoding="UTF-8"?>
<?xml-model href="http://www.tei-c.org/release/xml/tei/custom/schema/relaxng/tei_all.rng" type="application/xml" schematypens="http://relaxng.org/ns/structure/1.0"?>
<?xml-model href="http://www.tei-c.org/release/xml/tei/custom/schema/relaxng/tei_all.rng" type="application/xml"
	schematypens="http://purl.oclc.org/dsdl/schematron"?>
	<teiCorpus xmlns="http://www.tei-c.org/ns/1.0">
    <teiHeader>
        <fileDesc>
            <titleStmt>
                <title>Birmingham minimal metadata</title>
            </titleStmt>
            <publicationStmt><p>Records will be shared on https://melp.dh.tamu.edu/letters/</p></publicationStmt>
            <sourceDesc><p>XML created by Meredith Hale using OpenRefine</p></sourceDesc>
        </fileDesc>
    </teiHeader>
```

## Row Template

```
<TEI>
    <teiHeader>
        <fileDesc>
            <titleStmt>
                <title>{{cells['Title'].value}}</title>
                <author>{{cells['Creator'].value}}</author>
                <editor ref="Id_who">
                    <!--Editor on the Maria Edgeworth Letters Project overseeing the coding of this particular letter: FirstName LastName -->
                </editor>
                <sponsor>
                    <orgName>Maria Edgeworth Letters Project</orgName>
                </sponsor>
                <sponsor>Wake Forest University, University of Tennessee, Xavier University, Texas A&amp;M University</sponsor>
                <principal>Jessica Richard, Hilary Havens, Robin Runia, Susan Egenolf</principal>
                <respStmt>
                    <resp>Transcription and coding by</resp>
                    <persName ref="Id_who"><!--FirstName LastName-->
                    </persName>
                    <!-- List all transcribers or coders here, editors and students alike, <persName> by <persName>-->
                    <persName ref="Id_who"><!--FirstName LastName--></persName>
                    <!-- If you are the last person interacting with the file, enter your name last on the list -->
                </respStmt>
            </titleStmt>
                        <editionStmt>
                <edition>First digital edition in TEI, date: <!-- <date when="1111-11-11"> -->
                    <!--enter the date on which the first coder created and saved this XML file in google drive-->
                <!-- </date> -->
                </edition>
                <respStmt>
                    <orgName type="naf" ref="{{cells['org_URI'].value}}">{{cells['Holding Institution'].value}}</orgName>
                    <resp> photos include:
{{if(cells['Pages'].value==1, cells['Letter Identifier'].value + 
'_page01.jpg', '')}}
{{if(cells['Pages'].value==2, cells['Letter Identifier'].value + 
'_page01.jpg' + ', ' + cells['Letter Identifier'].value + 
'_page02.jpg', '')}}
{{if(cells['Pages'].value==3, cells['Letter Identifier'].value + 
'_page01.jpg' + ', ' + cells['Letter Identifier'].value + 
'_page02.jpg' + ', ' + cells['Letter Identifier'].value + '_page03.jpg', '')}}
{{if(cells['Pages'].value==4, cells['Letter Identifier'].value + 
'_page01.jpg' + ', ' + cells['Letter Identifier'].value + 
'_page02.jpg' + ', ' + cells['Letter Identifier'].value + '_page03.jpg' + ', ' + cells['Letter Identifier'].value + '_page04.jpg', '')}}
{{if(cells['Pages'].value==5, cells['Letter Identifier'].value + 
'_page01.jpg' + ', ' + cells['Letter Identifier'].value + 
'_page02.jpg' + ', ' + cells['Letter Identifier'].value + '_page03.jpg' + ', ' + cells['Letter Identifier'].value + '_page04.jpg' + ', ' + cells['Letter Identifier'].value + '_page05.jpg', '')}}
{{if(cells['Pages'].value==6, cells['Letter Identifier'].value + 
'_page01.jpg' + ', ' + cells['Letter Identifier'].value + 
'_page02.jpg' + ', ' + cells['Letter Identifier'].value + '_page03.jpg' + ', ' + cells['Letter Identifier'].value + '_page04.jpg' + ', ' + cells['Letter Identifier'].value + '_page05.jpg' + ', ' + cells['Letter Identifier'].value + '_page06.jpg', '')}}
                    </resp>
                </respStmt>
            </editionStmt>
                    <publicationStmt>
            <authority>Maria Edgeworth Letters Project</authority>
            <!--<date>YYYY</date>-->
            <availability>
               <!--Uncomment the appropriate line, based on the archive that holds the physical copy of this letter, 
                  and delete the other comment line(s).-->
               <p>Reproduced by courtesy of <orgName ref="{{cells['org_URI'].value}}">{{cells['Holding Institution'].value}}</orgName>.</p>
               <licence target="https://creativecommons.org/licenses/by/4.0/">Distributed under a Creative Commons Attribution 4.0 (CC BY 4.0) Unported License</licence>
            </availability>
            <idno>{{cells['Letter Identifier'].value}}</idno> 
         </publicationStmt>
         <seriesStmt>
            <title>Maria Edgeworth Letters Project</title>
         </seriesStmt>
         <sourceDesc>
            <msDesc xml:lang="en">
               <!-- This section of the header identifies the original manuscript source. -->
               <msIdentifier>
                  <repository ref="{{cells['org_URI'].value}}">{{cells['Holding Institution'].value}}</repository>
                  <collection><!-- Enter specific archival collection if applicable--></collection>
                  <idno>{{cells['Letter Identifier'].value}}</idno>
               </msIdentifier>
                    <head>Letter from 
                        <persName>{{cells['Creator'].value}}</persName>
                        to <persName>{{cells['Recipient'].value}}</persName>, <placeName><!--Location where letter was sent--></placeName>, 

{{if(isBlank(cells['Date of Original'].value), '', '<date when="' + cells['Date of Original'].value + '">' + cells['Date Text'].value + '</date>')}}
                  <!-- <stamp>Enter description, if applicable</stamp>-->
               </head>
               <physDesc>
                  <!-- optional physical description of the letter goes here: paper size and condition, seal, postmarks, etc.-->
               </physDesc>
            </msDesc>
            <bibl>In addition to our edited version, this letter was previously published in
               <!--complete bibiographical info if letter was published in a book here - if not delete-->
            </bibl>
         </sourceDesc>
      </fileDesc>
      <encodingDesc>
         <editorialDecl>
            <!--Where Edgeworth uses nonstandard spelling and hyphenation of words, transcriber-coders should use TEI elements “choice," “sic," and “reg" to encode both Edgeworth’s spelling and the regular international standard of Oxford English spelling, following the first listed spelling in the Oxford English Dictionary. -->
            <p>Edgeworth’s spelling and punctuation are retained in transcription, including non-standard spelling, line breaks, and hyphenation of words. The long s and ligatured forms are silently emended.</p>
         </editorialDecl>
      </encodingDesc>
      <profileDesc>
         <correspDesc>
            <correspAction type="sent">
               <persName>{{cells['Creator'].value}}</persName>
            </correspAction>
            <correspAction type="received">
               <persName>{{cells['Recipient'].value}}</persName>
            </correspAction>
         </correspDesc>
      </profileDesc>
      <revisionDesc>
         <change when="2021-01-01" who="Id_who">
            <!--Brief description of what you did here.-->
         </change>
      </revisionDesc>
   </teiHeader>
   <text>
      <body>
         <div type="letter">
            <pb n="1" facs="{{cells['Letter Identifier'].value + '_page01.jpg'}}"/>
            
            <opener>
                    <dateline><!--If there's no date line, remove this element. Record in the order in which it is written on the letter.-->
                        <name type="place" ref="Id_where"/>
                        {{if(isBlank(cells['Date of Original'].value), '<date/>', '<date when="' + cells['Date of Original'].value + '">' + cells['Date Text'].value + '</date>')}}</dateline>
                    <salute>
                        <persName>
                            <!-- Use if letter has a saluation ("Dear Sir," for example). If not, delete this line.-->
                        </persName>
                    </salute>
                </opener>
                <p><!-- Begin transcibing the body of the letter here. -->
                </p>
                <p>
                    <!--More body paragraphs as needed.--></p>
                <p>
                    <!--More body paragraphs as needed.-->
                    <!--Where there's a page break record it inside the relevant body paragraph like this, 
                  with the self-closing page-break element. n="2" indicates the START of the second page.-->
                  
{{if(cells['Pages'].value==2, '<pb n="2" facs="' + cells['Letter Identifier'].value + '_page02.jpg"/>', '')}}
                </p>
                <p><!--More body paragraphs as needed.--></p>
                <closer>
                    <!--include linebreaks, if used. example: <closer> Yours<lb/> Very sincerely<lb/> -->
                </closer>
                <postscript>
                    <p><!--A postscript goes here, outside the <closer>. --></p>
                </postscript>
                <!--You can include a <pb/> here, or inside the postScript.-->
                <!-- Format for postscripts. 
               Postscripts do NOT go inside closer tags. Adjust to take into account the order in your letter. 
               Sometimes the signature is on page three, the address on page four, then the postscript follows back on the top of page one, for example.-->
                <closer><!--Use the <closer> element again to hold Address Leaf information.-->
                    <address>
                        <!--Include any text written on the address leaf; use a separate "addrLine" for each line and indicate line breaks. -->
                        <addrLine/>
                        <addrLine/>
                        <addrLine/>
                    </address>
                </closer>
<!-- Page breaks will need to be rearranged and inserted into the text -->              
{{if(cells['Pages'].value==3, '<pb n="2" facs="' + cells['Letter Identifier'].value + '_page02.jpg"/>' + '<pb n="3" facs="' + cells['Letter Identifier'].value + '_page03.jpg"/>', '')}}
{{if(cells['Pages'].value==4, '<pb n="2" facs="' + cells['Letter Identifier'].value + '_page02.jpg"/>' + '<pb n="3" facs="' + cells['Letter Identifier'].value + '_page03.jpg"/>' + '<pb n="4" facs="' + cells['Letter Identifier'].value + '_page04.jpg"/>', '')}}
{{if(cells['Pages'].value==5, '<pb n="2" facs="' + cells['Letter Identifier'].value + '_page02.jpg"/>' + '<pb n="3" facs="' + cells['Letter Identifier'].value + '_page03.jpg"/>' + '<pb n="4" facs="' + cells['Letter Identifier'].value + '_page04.jpg"/>' + '<pb n="5" facs="' + cells['Letter Identifier'].value + '_page05.jpg"/>', '')}} 
{{if(cells['Pages'].value==6, '<pb n="2" facs="' + cells['Letter Identifier'].value + '_page02.jpg"/>' + '<pb n="3" facs="' + cells['Letter Identifier'].value + '_page03.jpg"/>' + '<pb n="4" facs="' + cells['Letter Identifier'].value + '_page04.jpg"/>' + '<pb n="5" facs="' + cells['Letter Identifier'].value + '_page05.jpg"/>' + '<pb n="6" facs="' + cells['Letter Identifier'].value + '_page06.jpg"/>', '')}}               
            </div>
        </body>
        <back> </back>
    </text>
  </TEI>
```

## Row Separator

**LEAVE BLANK**

## Suffix

```
</teiCorpus>

```