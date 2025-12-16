<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt3"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process">
    <sch:ns uri="http://www.tei-c.org/ns/1.0" prefix="tei"/>


    <!-- Check that "ref" attributes exist in all people, places, and works tags -->
    <sch:pattern>
        <sch:rule context="tei:text//(tei:persName | tei:placeName | title)">
            <sch:assert test="@ref or @type">&lt;<sch:value-of select="name()"/>&gt; elements must contain a
                @ref or @type attribute</sch:assert>
        </sch:rule>
    </sch:pattern>


    <!-- Check that "ref" attributes are correctly formatted -->
    <sch:pattern>
        <sch:let name="ographyMap" value="
                map {
                    'placeName': 'Placeography',
                    'persName': 'Personography',
                    'title': 'Workography'
                }"/>
        <sch:rule context="(tei:placeName | tei:persName | tei:title)/@ref">
            <sch:let name="parentName" value="name(..)"/>
            <sch:let name="ography" value="$ographyMap($parentName)"/>
            <sch:assert test="starts-with(., concat('./', $ography, '.xml#'))">@ref attributes on a
                    &lt;<sch:value-of select="$parentName"/>&gt; element must begin with a hash and
                reference to the <sch:value-of select="$ography"/> file</sch:assert>
        </sch:rule>
        <sch:rule context="(tei:placeName | tei:persName | tei:title)/@type">
            <sch:assert test="matches(., 'unknown')">
                @type attributes must have an "unknown" value
            </sch:assert>
        </sch:rule>
    </sch:pattern>


    <!-- Check that "ref" IDs are the correct format. Then, issue a warning message if they are not in the taxonomy terms -->
    <sch:pattern>
        <!-- Global ography pointers -->
        <sch:let name="pe"
            value="doc('https://raw.githubusercontent.com/Maria-Edgeworth-Letters-Project/me-tei/refs/heads/main/People_Places_Works/Personography.xml')"/>
        <sch:let name="pl"
            value="doc('https://raw.githubusercontent.com/Maria-Edgeworth-Letters-Project/me-tei/refs/heads/main/People_Places_Works/Placeography.xml')"/>
        <sch:let name="wo"
            value="doc('https://raw.githubusercontent.com/Maria-Edgeworth-Letters-Project/me-tei/refs/heads/main/People_Places_Works/Workography.xml')"/>
        <!-- tests -->
        <sch:rule context="tei:TEI//tei:persName/@ref">
            <sch:let name="pe-id" value="substring-after(., '#')"/>
            <sch:assert test="matches(., '[A-Z][A-Za-z]{2,3}[A-Z][1-9][0-9]?')">The @ref attribute
                value does not match the ID format in the Personography</sch:assert>
            <sch:assert test="$pe-id = $pe//tei:person/@xml:id" role="warning">Please confirm that
                the ID <sch:value-of select="$pe-id"/> is listed in MELP's Personography</sch:assert>
        </sch:rule>
        <sch:rule context="tei:TEI//tei:placeName/@ref">
            <sch:let name="pl-id" value="substring-after(., '#')"/>
            <sch:assert test="matches(., '[A-Za-z\-]*[0-9]*[_]?[A-Z]{2,3}')">The @ref attribute
                value does not match the ID format in the Placeography</sch:assert>
            <sch:assert test="$pl-id = $pl//tei:place/@xml:id" role="warning">Please confirm that
                the ID <sch:value-of select="$pl-id"/> is listed in MELP's Placeography</sch:assert>
        </sch:rule>
        <sch:rule context="tei:TEI//tei:title/@ref">
            <sch:let name="wo-id" value="substring-after(., '#')"/>
            <sch:assert test="matches(., '[A-Z][A-Za-z]{3,4}[1-9][0-9]?')">The @ref attribute value
                does not match the ID format in the Workography</sch:assert>
            <sch:assert test="$wo-id = $wo//tei:bibl/@xml:id" role="warning">Please confirm that the
                ID <sch:value-of select="$wo-id"/> is listed in MELP's Workography</sch:assert>
        </sch:rule>
    </sch:pattern>

</sch:schema>
