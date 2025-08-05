<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt3"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process">
<sch:ns uri="http://www.tei-c.org/ns/1.0" prefix="tei"/>
 
 
    <!-- Check that "ref" attributes exist in all people, places, and works tags -->
    <sch:pattern>
        <sch:rule context="//tei:text//tei:persName">
            <sch:assert test="boolean(@ref)">
                &lt;persName&gt; elements must contain a "ref" attribute
            </sch:assert>
        </sch:rule>
        <sch:rule context="//tei:text//tei:placeName">
            <sch:assert test="boolean(@ref)">
                &lt;placeName&gt; elements must contain a "ref" attribute
            </sch:assert>
        </sch:rule>   
        <sch:rule context="//tei:text//title">
            <sch:assert test="boolean(@ref)">
                &lt;title&gt; elements must contain a "ref" attribute
            </sch:assert>
        </sch:rule>
    </sch:pattern>
    
    
    <!-- Check that "ref" attributes are correctly formatted -->
    <sch:pattern>
        <sch:rule context="tei:TEI//tei:placeName/@ref">
            <sch:assert test="starts-with(., './Placeography.xml#')">
                "ref" attributes must begin with a hashtag and reference to the Placeography file
            </sch:assert>
        </sch:rule>
        <sch:rule context="tei:TEI//tei:persName/@ref">
            <sch:assert test="starts-with(., './Personography.xml#')">
                "ref" attributes must begin with a hashtag and reference to the Personography file
            </sch:assert>
        </sch:rule>    
        <sch:rule context="tei:TEI//tei:title/@ref">
            <sch:assert test="starts-with(., './Workography.xml#')">
                "ref" attributes must begin with a hashtag and reference to the Workography file
            </sch:assert>
        </sch:rule>      
    </sch:pattern>
   
    
    <!-- Check that "ref" IDs are the correct format. Then, issue a warning message if they are not in the taxonomy terms -->
    <sch:pattern>
        <sch:let name="pe"
            value="doc('https://raw.githubusercontent.com/Maria-Edgeworth-Letters-Project/me-tei/refs/heads/main/People_Places_Works/Personography.xml')"/>
        <sch:rule context="tei:TEI//tei:persName[@ref]">
            <sch:assert test="@ref/matches(., '[A-Z][a-z]{2,3}[A-Z][1-9][0-9]?')">
                The "ref" attribute value does not match the ID format in the Personography
            </sch:assert>
            <sch:let name="pe-id" value="@ref ! (substring-after(., '#'))"/>
            <sch:assert test="$pe-id = $pe//tei:person/@xml:id" role="warning">
                Please confirm that the ID <value-of select="$pe-id"/> is listed in MELP's Personography
            </sch:assert>
        </sch:rule>
    </sch:pattern>
    <sch:pattern>
        <sch:let name="pl"
            value="doc('https://raw.githubusercontent.com/Maria-Edgeworth-Letters-Project/me-tei/refs/heads/main/People_Places_Works/Placeography.xml')"/> 
        <sch:rule context="tei:TEI//tei:placeName[@ref]">
            <sch:assert test="@ref/matches(., '[A-Za-z\-]*[0-9]*[_]?[A-Z]{2,3}')">
                The "ref" attribute value does not match the ID format in the Placeography
            </sch:assert>
            <sch:let name="pl-id" value="@ref ! (substring-after(., '#'))"/>
            <sch:assert test="$pl-id = $pl//tei:place/@xml:id" role="warning">
                Please confirm that the ID <value-of select="$pl-id"/> is listed in MELP's Placeography
            </sch:assert>
        </sch:rule>
    </sch:pattern>
    <sch:pattern>
       <sch:let name="wo"
           value="doc('https://raw.githubusercontent.com/Maria-Edgeworth-Letters-Project/me-tei/refs/heads/main/People_Places_Works/Workography.xml')"/> 
        <sch:rule context="tei:TEI//tei:title[@ref]">
            <sch:assert test="@ref/matches(., '[A-Z][A-Za-z]{3,4}[1-9][0-9]?')">
                The "ref" attribute value does not match the ID format in the Workography
            </sch:assert>
            <sch:let name="wo-id" value="@ref ! (substring-after(., '#'))"/>
            <sch:assert test="$wo-id = $wo//tei:bibl/@xml:id" role="warning">
                Please confirm that the ID <value-of select="$wo-id"/> is listed in MELP's Workography
            </sch:assert>
        </sch:rule>
    </sch:pattern>
    
</sch:schema>