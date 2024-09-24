SCHEMAS="test_schemas/schemas.xsd"
ENCODED_LETTERS="../Encoded Letters"


testShunitIntalled() {
    assertNotNull $(which shunit2)
}

testIfCollectionRecordsValid() {
    for filename in $ENCODED_LETTERS/*.xml; do
        RESPONSE=$(xmllint --noout --schema ${SCHEMAS} ${filename} 2>&1 1>/dev/null | cat)
        assertEquals "${RESPONSE}" "${filename} validates"
    done
}

. shunit2